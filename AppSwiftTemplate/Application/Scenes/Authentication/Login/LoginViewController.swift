//
//  LoginViewController.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 13/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    enum Field {
        static let email = "email"
        static let lastName = "last_name"
        static let firstName = "first_name"
    }

    var form: Form!
    var formTextFieldChainable: FormTextFieldDelegateChainable!

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var closeButton: UIButton!

    public class func newInstance() -> LoginViewController {
        return LoginViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createForm()
    }

    override func setupUI(theme: Theme) {
        super.setupUI(theme: theme)
        self.title = "login.title".localized()
        self.emailTextField.setAppearance(theme.input)
        self.emailTextField.setPlaceholderAppearance(theme.placeholder,
                                                     placeholder: "login.email.placeholder".localized())
        self.lastNameTextField.setAppearance(theme.input)
        self.lastNameTextField.setPlaceholderAppearance(theme.placeholder,
                                                     placeholder: "login.last_name.placeholder".localized())
        self.firstNameTextField.setAppearance(theme.input)
        self.firstNameTextField.setPlaceholderAppearance(theme.placeholder,
                                                     placeholder: "login.first_name.placeholder".localized())

        self.submitButton.setAppearance(theme.action)
        self.submitButton.setTitle("login.submit".localized(), for: .normal)

        self.closeButton.setAppearance(theme.action)
    }

    func createForm() {
        let form = Form(fields: [
            .init(identifier: Field.email,
                target: self.emailTextField,
                name: "login.email".localized(),
                validator: FieldValidators.group(
                    FieldValidators.required(),
                    FieldValidators.email()
                ),
                transformer: FieldTransformers.group(
                    FieldTransformers.trim(),
                    FieldTransformers.emptyIsNil()
                )
            ),
            .init(identifier: Field.lastName,
                  target: self.lastNameTextField,
                  name: "login.last_name".localized(),
                  validator: FieldValidators.group(
                    FieldValidators.min(length: 2),
                    FieldValidators.max(length: 30)
                ),
                  transformer: FieldTransformers.group(
                    FieldTransformers.trim(),
                    FieldTransformers.emptyIsNil()
                )
            ),
            .init(identifier: Field.firstName,
                  target: self.firstNameTextField,
                  name: "login.first_name".localized(),
                  validator: FieldValidators.group(
                    FieldValidators.min(length: 2),
                    FieldValidators.max(length: 30)
                ),
                  transformer: FieldTransformers.group(
                    FieldTransformers.trim(),
                    FieldTransformers.emptyIsNil()
                )
            )
        ], delegate: self)
        let formTextFieldChainable = FormTextFieldDelegateChainable(form: form)
        self.emailTextField.delegate = formTextFieldChainable
        self.lastNameTextField.delegate = formTextFieldChainable
        self.firstNameTextField.delegate = formTextFieldChainable
        self.form = form
        self.formTextFieldChainable = formTextFieldChainable
    }

    @IBAction func touchClose() {
        self.dismiss(animated: true)
    }

    @IBAction func touchSubmit() {
        self.view.endEditing(true)
        do {
            try self.form.validate()
        } catch {
            self.presentAlert(style: .error, message: error.localizedDescription)
            return
        }
        Session.start()
        self.touchClose()
    }
}

extension LoginViewController: FormDelegate {

    func formDidSubmit(_ form: Form) {
        self.touchSubmit()
    }
}
