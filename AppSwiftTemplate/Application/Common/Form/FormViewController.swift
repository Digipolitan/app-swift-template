//
//  FormViewController.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 03/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit
import Foundation

open class FormViewController: BaseViewController, FormDelegate {

    public var form: Form!

    public func present(error: FormError) {
        var str = ""
        if let name = error.field.name {
            str = "\(name): "
        }
        str += error.localizedDescription
        self.showAlert(style: .error, message: str)
    }
}
