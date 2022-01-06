//
//  AppColors.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

extension UIColor {
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

enum AppColors {
    static let black: UIColor = .rgba(34, 40, 49)
    static let gray: UIColor = .rgba(170, 170, 173)
    static let lightGray: UIColor = .rgba(243, 245, 249)
    static let pink: UIColor = .rgba(253, 58, 105)
    
    static let white: UIColor = .rgba(255, 255, 255)
    
    static let lightPurple: UIColor = .rgba(98, 98, 220)
}
