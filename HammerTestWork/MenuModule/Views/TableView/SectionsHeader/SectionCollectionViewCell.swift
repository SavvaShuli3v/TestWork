//
//  SectionCollectionViewCell.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class SectionCollectionViewCell: UICollectionViewCell {
    lazy var contextLabel = UILabel()
    private lazy var bubble = makeBubble()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(with title: String) {
        contextLabel.text = title
        updateConstraints()
    }
    
    func setActiveContext() {
        contextLabel.textColor = AppColors.pink
        bubble.backgroundColor = AppColors.maxLightPink
        bubble.layer.borderWidth = 0
        contextLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    func removePreviousContext() {
        contextLabel.textColor = AppColors.lightPink
        bubble.backgroundColor = .clear
        bubble.layer.borderWidth = 1
        contextLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(bubble)
        addSubview(contextLabel)
        contextLabel.translatesAutoresizingMaskIntoConstraints = false
        contextLabel.top(10)
        contextLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contextLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        contextLabel.textColor = AppColors.gray
        
        bubble.translatesAutoresizingMaskIntoConstraints = false
        bubble.centerYAnchor.constraint(equalTo: contextLabel.centerYAnchor).isActive = true
        bubble.height(32)
        bubble.leading(-23, to: contextLabel.leadingAnchor)
        bubble.trailing(23, to: contextLabel.trailingAnchor)
    }
}

private func makeBubble() -> UIView {
    let view = UIView()
    view.backgroundColor = .clear
    view.layer.borderWidth = 1
    view.layer.borderColor = AppColors.lightPink.cgColor
    view.layer.cornerRadius = 16
    return view
}
