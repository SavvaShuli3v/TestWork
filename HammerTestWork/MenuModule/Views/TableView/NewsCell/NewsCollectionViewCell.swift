//
//  NewsCollectionViewCell.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class NewsCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView = makeImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 10
    imageView.image = UIImage.init(named: "news")
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFit
    return imageView
}
