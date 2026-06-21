//
//  ContentPermissionPresentation.swift
//  Reynard
//
//  Created by Minh Ton on 16/6/26.
//

import GeckoView
import Foundation

extension ContentPermission {
    var alertTitle: String? {
        let host = Self.permissionHost(from: uri)
        switch permission {
        case .geolocation:
            return "允许 \(host) 使用您的位置？"
        case .desktopNotification:
            return "允许 \(host) 发送通知？"
        case .persistentStorage:
            return "允许 \(host) 在持久存储中存储数据？"
        case .mediaKeySystemAccess:
            return "允许 \(host) 播放受 DRM 保护的内容？"
        case .storageAccess:
            return "允许 \(Self.permissionHost(from: thirdPartyOrigin)) 在 \(host) 上使用其 Cookie？"
        case .localDeviceAccess:
            return "允许 \(host) 访问此设备上的其他应用和服务？"
        case .localNetworkAccess:
            return "允许 \(host) 访问连接到本地网络的设备上的应用和服务？"
        case .deviceSensors:
            return "允许 \(host) 使用运动和方向传感器？"
        case .camera,
                .microphone,
                .webxr,
                .autoplay,
                .tracking,
            nil:
            return nil
        }
    }
    
    var alertMessage: String? {
        switch permission {
        case .storageAccess:
            return "如果不清楚 \(Self.permissionHost(from: thirdPartyOrigin)) 为何需要此数据，您可能需要阻止访问。"
        case .camera,
                .microphone,
                .geolocation,
                .desktopNotification,
                .persistentStorage,
                .webxr,
                .autoplay,
                .mediaKeySystemAccess,
                .tracking,
                .localDeviceAccess,
                .localNetworkAccess,
                .deviceSensors,
            nil:
            return nil
        }
    }
    
    static func mediaAlertTitle(uri: String, videoRequested: Bool, audioRequested: Bool) -> String {
        let host = permissionHost(from: uri)
        switch (videoRequested, audioRequested) {
        case (true, true):
            return "允许 \(host) 使用您的摄像头和麦克风？"
        case (true, false):
            return "允许 \(host) 使用您的摄像头？"
        case (false, true):
            return "允许 \(host) 使用您的麦克风？"
        case (false, false):
            return "允许 \(host) 使用您的摄像头和麦克风？"
        }
    }
}
