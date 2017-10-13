//
//  HomeViewController.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 27/09/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeViewController: BaseViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var logoutButton: UIButton!

    public class func newInstance() -> HomeViewController {
        return HomeViewController()
    }

    override func setupUI(theme: Theme) {
        super.setupUI(theme: theme)
        self.title = "home.title".localized()
        self.titleLabel.setAppearance(theme.h1)

        self.loginButton.setAppearance(theme.action)
        self.loginButton.setTitle("home.login".localized(), for: .normal)
        self.logoutButton.setAppearance(theme.action)
        self.logoutButton.setTitle("home.logout".localized(), for: .normal)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateSessionUI()
    }

    func updateSessionUI() {
        if self.session != nil {
            self.loginButton.isHidden = true
            self.logoutButton.isHidden = false
        } else {
            self.loginButton.isHidden = false
            self.logoutButton.isHidden = true
        }
    }

    @IBAction func touchLogout() {
        self.session?.destroy()
        self.updateSessionUI()
    }

    @IBAction func touchLogin() {
        self.present(LoginViewController.newInstance(), animated: true)
    }
}
