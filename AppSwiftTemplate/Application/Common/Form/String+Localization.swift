//
//  String+Localization.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 09/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

extension String {

    public func localized(bundle: Bundle = .main, table: String? = nil, value: String? = nil) -> String {
        return bundle.localizedString(forKey: self, value: value, table: table)
    }

    public func localized(arguments: CVarArg..., bundle: Bundle = .main, table: String? = nil, value: String? = nil) -> String {
        return String(format: bundle.localizedString(forKey: self, value: value, table: table), arguments: arguments)
    }
}
