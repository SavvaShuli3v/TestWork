//
//  String + Extension.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 07.01.2022.
//

import UIKit

extension String {
func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
    let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.text = self
    label.font = font
    label.sizeToFit()

    return label.frame.height
 }
}
