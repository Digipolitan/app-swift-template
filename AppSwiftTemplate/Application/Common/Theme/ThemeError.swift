//
//  ThemeError.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 06/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public enum ThemeError: Error {
    case noSuchTheme(file: String)
    case malformatedTheme
}
