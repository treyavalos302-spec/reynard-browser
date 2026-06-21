//
//  AddonErrorPresentation.swift
//  Reynard
//
//  Created by Minh Ton on 24/5/26.
//

import Foundation

public struct AddonErrorPresentation {
    public let statusText: String?
    public let alertMessage: String
    public let isUserCancelled: Bool
}

public struct AddonErrorPresenter {
    public static func updateRequiresPermissions(_ error: Error) -> Bool {
        return normalizeCode(installErrorDetails(from: error).code) == "ERROR_POSTPONED"
    }
    
    public static func installErrorPresentation(
        for error: Error,
        addonName: String?
    ) -> AddonErrorPresentation {
        let details = installErrorDetails(from: error)
        return presentation(
            code: details.code,
            addonName: addonName,
            isInstallation: true,
            cancelledByUser: details.cancelledByUser
        )
    }
    
    public static func updateErrorPresentation(
        for error: Error,
        addonName: String?
    ) -> AddonErrorPresentation {
        let details = installErrorDetails(from: error)
        return presentation(
            code: details.code,
            addonName: addonName,
            isInstallation: false,
            cancelledByUser: details.cancelledByUser
        )
    }
    
    private static func installErrorDetails(from error: Error) -> (code: String?, cancelledByUser: Bool) {
        guard let value = Mirror(reflecting: error).descendant("value") as? [String: Any?] else {
            return (nil, false)
        }
        
        let installError: String?
        if let number = value["installError"] as? NSNumber {
            installError = number.stringValue
        } else if let number = value["code"] as? NSNumber {
            installError = number.stringValue
        } else if let string = value["installError"] as? String {
            installError = string
        } else if let string = value["code"] as? String {
            installError = string
        } else {
            installError = nil
        }
        
        let cancelledByUser: Bool
        if let value = value["cancelledByUser"] as? NSNumber {
            cancelledByUser = value.boolValue
        } else if let value = value["cancelledByUser"] as? Bool {
            cancelledByUser = value
        } else {
            cancelledByUser = false
        }
        
        return (installError, cancelledByUser)
    }
    
    private static func presentation(
        code: String?,
        addonName: String?,
        isInstallation: Bool,
        cancelledByUser: Bool = false
    ) -> AddonErrorPresentation {
        let trimmedAddonName = addonName?.trimmingCharacters(in: .whitespacesAndNewlines)
        let resolvedAddonName: String
        if let trimmedAddonName, !trimmedAddonName.isEmpty {
            resolvedAddonName = trimmedAddonName
        } else {
            resolvedAddonName = Localized.thisExtension
        }
        let normalizedCode = normalizeCode(code)
        
        if cancelledByUser || normalizedCode == Localized.errorUserCanceled || normalizedCode == Localized.errorAborted {
            return AddonErrorPresentation(
                statusText: nil,
                alertMessage: isInstallation ? defaultInstallMessage(for: trimmedAddonName) : Localized.failedToUpdateExtension,
                isUserCancelled: true
            )
        }
        
        switch normalizedCode {
        case Localized.errorBlocklisted: // Original: ERROR_BLOCKLISTED
            return AddonErrorPresentation(
                statusText: Localized.blocked,
                alertMessage: String(format: Localized.addonViolatesPolicies, resolvedAddonName),
                isUserCancelled: false
            )
        case Localized.errorSoftBlocked: // Original: ERROR_SOFT_BLOCKED
            return AddonErrorPresentation(
                statusText: Localized.restricted,
                alertMessage: String(format: Localized.addonRestricted, resolvedAddonName),
                isUserCancelled: false
            )
        case Localized.errorNetworkFailure: // Original: ERROR_NETWORK_FAILURE
            return AddonErrorPresentation(
                statusText: Localized.networkError,
                alertMessage: Localized.connectionFailure,
                isUserCancelled: false
            )
        case Localized.errorCorruptFile: // Original: ERROR_CORRUPT_FILE
            return AddonErrorPresentation(
                statusText: Localized.corruptFile,
                alertMessage: Localized.fileCorrupt,
                isUserCancelled: false
            )
        case Localized.errorSignedStateRequired: // Original: ERROR_SIGNEDSTATE_REQUIRED
            return AddonErrorPresentation(
                statusText: Localized.notVerified,
                alertMessage: Localized.notVerifiedMessage,
                isUserCancelled: false
            )
        case Localized.errorIncompatible: // Original: ERROR_INCOMPATIBLE
            return AddonErrorPresentation(
                statusText: Localized.incompatible,
                alertMessage: String(format: Localized.incompatibleMessage, resolvedAddonName),
                isUserCancelled: false
            )
        case Localized.errorAdminInstallOnly: // Original: ERROR_ADMIN_INSTALL_ONLY
            return AddonErrorPresentation(
                statusText: Localized.adminOnly,
                alertMessage: String(format: Localized.adminOnlyMessage, resolvedAddonName),
                isUserCancelled: false
            )
        default:
            return AddonErrorPresentation(
                statusText: isInstallation ? Localized.error : Localized.updateFailed,
                alertMessage: isInstallation ? defaultInstallMessage(for: trimmedAddonName) : Localized.failedToUpdateExtension,
                isUserCancelled: false
            )
        }
    }
    
    private static func defaultInstallMessage(for addonName: String?) -> String {
        if let addonName, !addonName.isEmpty {
            return String(format: Localized.failedToInstallAddon, addonName)
        }
        return Localized.failedToInstallThisExtension
    }
    
    private static func normalizeCode(_ code: String?) -> String? {
        guard let code = code?.trimmingCharacters(in: .whitespacesAndNewlines), !code.isEmpty else {
            return nil
        }
        
        switch code {
        case "-1", Localized.errorNetworkFailure:
            return Localized.errorNetworkFailure
        case "-3", Localized.errorCorruptFile:
            return Localized.errorCorruptFile
        case "-5", Localized.errorSignedStateRequired:
            return Localized.errorSignedStateRequired
        case "-10", Localized.errorBlocklisted:
            return Localized.errorBlocklisted
        case "-11", Localized.errorIncompatible:
            return Localized.errorIncompatible
        case "-13", Localized.errorAdminInstallOnly:
            return Localized.errorAdminInstallOnly
        case "-14", Localized.errorSoftBlocked:
            return Localized.errorSoftBlocked
        case "-12", Localized.errorPostponed:
            return Localized.errorPostponed
        case "-100", Localized.errorUserCanceled, "ERROR_USER_CANCELLED":
            return Localized.errorUserCanceled
        default:
            return code
        }
    }
}
