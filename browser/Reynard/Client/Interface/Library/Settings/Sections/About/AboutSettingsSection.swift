//
//  AboutSettingsSection.swift
//  Reynard
//
//  Created by Minh Ton on 18/6/26.
//

import GeckoView
import UIKit

struct AboutSettingsSection {
    enum Row: CaseIterable {
        case appVersion
        case engineVersion
        case sourceCode
        case supportProject
        case githubProfile
    }
    
    var rowCount: Int {
        return Row.allCases.count
    }
    
    func cell(at index: Int) -> UITableViewCell {
        guard Row.allCases.indices.contains(index) else {
            return UITableViewCell()
        }
        
        switch Row.allCases[index] {
        case .appVersion:
            let info = Bundle.main.infoDictionary
            let version = info?["CFBundleShortVersionString"] as? String ?? "Unknown"
            let build = info?["CFBundleVersion"] as? String ?? "Unknown"
            return valueCell(title: Localized.reynardBrowser, value: "\(version) (\(build))")
        case .engineVersion:
            return valueCell(title: Localized.engineVersion, value: GeckoRuntime.version)
        case .sourceCode:
            return linkCell(title: Localized.viewSourceCode)
        case .supportProject:
            return linkCell(title: Localized.supportProject)
        case .githubProfile:
            return linkCell(title: Localized.githubProfile)
        }
    }
    
    func selectRow(at index: Int) {
        guard Row.allCases.indices.contains(index),
              let url = url(for: Row.allCases[index]) else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func url(for row: Row) -> URL? {
        switch row {
        case .sourceCode:
            return URL(string: "https://github.com/minh-ton/reynard-browser")
        case .supportProject:
            return URL(string: "https://buymeacoffee.com/hnimnot")
        case .githubProfile:
            return URL(string: "https://github.com/minh-ton")
        case .appVersion, .engineVersion:
            return nil
        }
    }
    
    private func valueCell(title: String, value: String) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = value
        cell.detailTextLabel?.textColor = .secondaryLabel
        cell.selectionStyle = .none
        cell.accessoryType = .none
        return cell
    }
    
    private func linkCell(title: String) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = title
        cell.textLabel?.textColor = .systemBlue
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
