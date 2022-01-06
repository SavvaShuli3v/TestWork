//
//  CityButton.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class CityButton: UIButton {
    
    private lazy var label = makeCityLabel()
    private lazy var mainImageView = makeImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(mainImageView)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.top(2)
        label.leading(0)
        label.height(20)
        
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.leading(8, to: label.trailingAnchor)
        mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainImageView.width(14)
        mainImageView.height(8)
        
    }
}

private func makeCityLabel() -> UILabel {
    let label = UILabel()
    label.text = Localization.moscow
    label.textColor = AppColors.black
    label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    return label
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage.init(named: "pointer")
    return imageView
}
