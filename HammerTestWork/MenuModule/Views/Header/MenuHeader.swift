//
//  MenuHeader.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuHeader: UIView {
    
    private lazy var cityButton = CityButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.lightGray
        addSubview(cityButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cityButton.frame = CGRect(
            origin: CGPoint(x: 16, y: 16),
            size: CGSize(width: 80, height: 24))
    }
}
