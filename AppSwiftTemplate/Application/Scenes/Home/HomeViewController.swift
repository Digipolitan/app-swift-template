//
//  HomeViewController.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 27/09/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"

        let theme = ThemeManager.shared.current
        self.titleLabel.setTextAppearance(theme.h1)
    }
}
