//
//  FormError.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 06/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public struct FormError: LocalizedError {

    public let field: FormField
    public let error: Error

    init(field: FormField, error: Error) {
        self.field = field
        self.error = error
    }

    public var errorDescription: String? {
        guard let localized = self.error as? LocalizedError else {
            return nil
        }
        return localized.errorDescription
    }
}
