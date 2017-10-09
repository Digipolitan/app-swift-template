//
//  FieldValidator.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 03/07/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public protocol FieldValidator {

    static var failureKey: String! { get }

    func validate(field: FormField, in form: Form) throws
}

public struct FieldValidatorClosure: FieldValidator {

    public static var failureKey: String! = nil

    private let closure: (FormField, Form) throws -> Void

    public init(closure: @escaping (FormField, Form) throws -> Void) {
        self.closure = closure
    }

    public func validate(field: FormField, in form: Form) throws {
        try self.closure(field, form)
    }
}

public struct FieldValidatorArray: FieldValidator {

    public static var failureKey: String! = nil

    public let validators: [FieldValidator]

    public init(validators: [FieldValidator]) {
        self.validators = validators
    }

    public func validate(field: FormField, in form: Form) throws {
        try self.validators.forEach { try $0.validate(field: field, in: form) }
    }
}
