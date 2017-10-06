//
//  ThemeManager.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 05/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public class ThemeManager {

    public static var defaultBundle: Bundle = .main

    public static let infoKey = "Themes"

    public enum Keys {
        public static let currentTheme: String = "app.currentTheme"
    }

    public static let `shared`: ThemeManager = {
        do {
            return try ThemeManager()
        } catch {
            fatalError(error.localizedDescription)
        }
    }()

    public let themes: [Theme]

    public var current: Theme {
        didSet {
            let userDefaults = UserDefaults.standard
            userDefaults.set(current.identifier, forKey: Keys.currentTheme)
            userDefaults.synchronize()
        }
    }

    private init() throws {
        guard let info = ThemeManager.defaultBundle.infoDictionary,
            let themeFiles = info[ThemeManager.infoKey] as? [String] else {
                fatalError("[!] Missing or invalid theme list; set themes in Info.plist key '\(ThemeManager.infoKey)'")
        }
        self.themes = try themeFiles.map { try Theme(file: $0, bundle: ThemeManager.defaultBundle) }
        let userDefaults = UserDefaults.standard
        if let identifier = userDefaults.string(forKey: Keys.currentTheme),
            let theme = self.themes.first(where: { $0.identifier == identifier }) {
            self.current = theme
        } else {
            self.current = themes[0]
        }
    }
}
