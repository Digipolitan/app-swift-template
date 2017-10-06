//
//  UIColor+RGB255.swift
//  AppSwiftTemplate
//
//  Created by Benoit BRIATTE on 05/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

public extension UIColor {
    public static func rgb255(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}
