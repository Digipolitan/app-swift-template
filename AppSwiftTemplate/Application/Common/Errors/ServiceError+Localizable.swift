//
//  ServiceResult+Localizable.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 09/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import LocalizationToolkit
import Domain

extension ServiceError {

    public func defaultDescription() -> String {
        switch self.code {
        case .badRequest:
            return "errors.service.bad_request".localized()
        case .communication:
            return "errors.service.communication".localized()
        case .unauthorized:
            return "errors.service.unauthorized".localized()
        default:
            return "errors.service.unknown".localized()
        }
    }
}
