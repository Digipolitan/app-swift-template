//
//  BaseViewController.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 06/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {

    @IBOutlet
    var keyboardView: UIView?

    public var keyboardOptions = Keyboard.Options(mode: .insets)

    public var session: Session? {
        return Session.restore()
    }

    public var keyboard: Keyboard?

    func setupUI(theme: Theme) {
        self.view.setAppearance(theme.scene)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI(theme: ThemeManager.shared.current)
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let kv = self.keyboardView {
            self.keyboard = Keyboard(view: kv, options: self.keyboardOptions)
        }
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.keyboard = nil
    }
}
