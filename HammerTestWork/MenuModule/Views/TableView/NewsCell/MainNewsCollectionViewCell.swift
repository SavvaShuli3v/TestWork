//
//  MainNewsCollectionViewCell.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MainNewsCollectionViewCell: UICollectionViewCell {
    
    private lazy var collectionView = NewsCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.lightGray
        contentView.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: bounds.width, height: 113)
        )
    }
}
