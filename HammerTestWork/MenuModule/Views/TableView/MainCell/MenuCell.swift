//
//  MenuCell.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuCell: UICollectionViewCell {
    
    private lazy var mainImageView = makeImageView()
    private lazy var mainLabel = makeMainLabel()
    private lazy var aboutLabel = makeAboutLabel()
    private lazy var priceLabel = makePriceLabel()
    private lazy var lineView = makeLine()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.white
        addSubview(mainImageView)
        addSubview(mainLabel)
        addSubview(aboutLabel)
        addSubview(priceLabel)
        addSubview(lineView)
        setLayoutForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMenuPosition(with model: MenuModel) {
        mainImageView.image = model.image
        mainLabel.text = model.name
        aboutLabel.text = model.about
        setPrice(with: model.minPrice)
    }
    
    func setIndexPath(with indexPath: Int) {
        guard indexPath == 0 else {
            roundCorners(.nothing, radius: 0)
            return
        }
        roundCorners(.top, radius: 30)
    }
    
    private func setLayoutForViews() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.leading(16)
        mainImageView.height(132)
        mainImageView.width(123)
        mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.top(32)
        mainLabel.leading(32, to: mainImageView.trailingAnchor)
        mainLabel.trailing(-24)
        mainLabel.height(20)
        
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.top(8, to: mainLabel.bottomAnchor)
        aboutLabel.leading(32, to: mainImageView.trailingAnchor)
        aboutLabel.trailing(-24)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.top(16, to: aboutLabel.bottomAnchor)
        priceLabel.trailing(-24)
        priceLabel.height(32)
        priceLabel.width(87)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.bottom()
        lineView.leading()
        lineView.trailing()
        lineView.height(1)
    }
    
    private func setPrice<T: Comparable>(with price: T) {
        priceLabel.text = "от \(price) р"
    }
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.textColor = AppColors.black
    label.text = "Ветчина и грибы"
    label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    return label
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage.init(named: "pizza")
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFit
    return imageView
}

private func makeAboutLabel() -> UILabel {
    let label = UILabel()
    label.textColor = AppColors.gray
    label.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
    label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    label.numberOfLines = 0
    return label
}

private func makePriceLabel() -> UILabel {
    let label = UILabel()
    label.text = "от 345 р"
    label.textColor = AppColors.pink
    label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    label.textAlignment = .center
    label.backgroundColor = .clear
    label.layer.cornerRadius = 6
    label.layer.borderWidth = 1
    label.layer.borderColor = AppColors.pink.cgColor
    return label
}

private func makeLine() -> UIView {
    let view = UIView()
    view.backgroundColor = AppColors.lightGray
    return view
}
