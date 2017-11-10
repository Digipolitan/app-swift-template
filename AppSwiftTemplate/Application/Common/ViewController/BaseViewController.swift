//
//  BaseViewController.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 06/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit
import Monet
import AutomaticKeyboard
import SessionKit

open class BaseViewController: UIViewController {

    @IBOutlet var keyboardView: UIView?

    public var keyboardOptions = AutomaticKeyboard.Options(mode: .insets)

    public lazy var loaderView: LoaderView = {
        let loader: LoaderView = .fromNib("BasicLoaderView")
        loader.setupUI(theme: self.theme)
        return loader
    }()

    public var theme: Theme {
        return ThemeManager.shared.current
    }

    public var session: Session? {
        return Session.restore()
    }

    public var keyboard: AutomaticKeyboard?

    open func setupUI(theme: Theme) {
        self.view.setAppearance(theme.scene)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI(theme: self.theme)
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let kv = self.keyboardView {
            self.keyboard = AutomaticKeyboard(view: kv, options: self.keyboardOptions)
        }
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.keyboard = nil
    }

    public func addChildViewController(_ childController: UIViewController, to parent: UIView) {
        childController.view.frame = parent.bounds
        childController.view.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(childController.view)
        NSLayoutConstraint.activate(childController.view.constraintMatch(parent: parent))
        self.addChildViewController(childController)
    }
}
