//
//  BaseViewController+Alert.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 06/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import SwiftMessages

extension BaseViewController {

    public enum AlertStyle {
        case info
        case success
        case warning
        case error
    }

    public func showAlert(style: AlertStyle = .info, message: String) {
        switch style {
        case .success:
            self.showSuccessAlert(message)
        case .info:
            self.showInfoAlert(message)
        case .warning:
            self.showWarningAlert(message)
        case .error:
            self.showErrorAlert(message)
        }
    }

    private func defaultMessageView() -> MessageView {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.iconImageView?.isHidden = true
        return view
    }

    private func defaultMessageConfig() -> SwiftMessages.Config {
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        return config
    }

    private func showSuccessAlert(_ message: String) {
        let success = self.defaultMessageView()
        success.configureTheme(.success)
        success.configureContent(title: "", body: message)
        SwiftMessages.show(config: self.defaultMessageConfig(), view: success)
    }

    private func showInfoAlert(_ message: String) {
        let info = self.defaultMessageView()
        info.configureTheme(.info)
        info.configureContent(title: "", body: message)
        SwiftMessages.show(config: self.defaultMessageConfig(), view: info)
    }

    private func showWarningAlert(_ message: String) {
        let warning = self.defaultMessageView()
        warning.configureTheme(.warning)
        warning.configureContent(title: "", body: message)
        SwiftMessages.show(config: self.defaultMessageConfig(), view: warning)
    }

    private func showErrorAlert(_ message: String) {
        let error = self.defaultMessageView()
        error.configureTheme(.error)
        error.configureContent(title: "", body: message)
        SwiftMessages.show(config: self.defaultMessageConfig(), view: error)
    }
}
