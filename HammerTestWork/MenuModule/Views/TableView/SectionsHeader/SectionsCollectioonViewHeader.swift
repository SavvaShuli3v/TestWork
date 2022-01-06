//
//  SectionsCollectioonViewHeader.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class SectionsCollectioonViewHeader: UICollectionReusableView {
    
    private lazy var collectionView = SectionsCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
}
