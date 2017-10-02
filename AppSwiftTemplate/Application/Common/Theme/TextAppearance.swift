//
//  TextAppearence.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 01/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

public struct TextAppearance {
    public let backgroundColor: UIColor
    public let foregroundColor: UIColor
    public let font: UIFont

    public init(backgroundColor: UIColor = .clear, foregroundColor: UIColor = .black, font: UIFont = .systemFont(ofSize: UIFont.systemFontSize)) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.font = font
    }
}

extension TextAppearance {

    public func reverse() -> TextAppearance {
        return TextAppearance(backgroundColor: self.foregroundColor, foregroundColor: self.backgroundColor, font: self.font)
    }
}

public extension UILabel {

    public func setTextAppearance(_ textAppearance: TextAppearance) {
        self.backgroundColor = textAppearance.backgroundColor
        self.textColor = textAppearance.foregroundColor
        self.font = textAppearance.font
    }
}

public extension UIButton {

    public func setTextAppearance(_ textAppearance: TextAppearance) {
        self.backgroundColor = textAppearance.backgroundColor
        self.setTitleColor(textAppearance.foregroundColor, for: .normal)
        self.titleLabel?.font = textAppearance.font
    }
}

public extension UITextField {

    public func setTextAppearance(_ textAppearance: TextAppearance) {
        self.backgroundColor = textAppearance.backgroundColor
        self.textColor = textAppearance.foregroundColor
        self.font = textAppearance.font
    }

    public func setPlaceholderAppearance(_ textAppearance: TextAppearance, placeholder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            NSForegroundColorAttributeName: textAppearance.foregroundColor,
            NSBackgroundColorAttributeName: textAppearance.backgroundColor,
            NSFontAttributeName: textAppearance.font
        ])
    }
}

public extension UITextView {

    public func setTextAppearance(_ textAppearance: TextAppearance) {
        self.backgroundColor = textAppearance.backgroundColor
        self.textColor = textAppearance.foregroundColor
        self.font = textAppearance.font
    }
}
