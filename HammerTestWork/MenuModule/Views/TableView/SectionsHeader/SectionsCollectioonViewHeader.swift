//
//  SectionsCollectioonViewHeader.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

protocol SectionsCollectioonViewHeaderProtocol: AnyObject {
    func didTapToCell(with indexPath: IndexPath)
}

final class SectionsCollectioonViewHeader: UICollectionReusableView {
    weak var answerDelegate: SectionsCollectioonViewHeaderProtocol?
    
    private lazy var shadowView = UIView()
    private lazy var collectionView = SectionsCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(collectionView)
        collectionView.answerDelegate = self
        
        addSubview(shadowView)
        shadowView.layer.shadowColor = AppColors.black.cgColor
        shadowView.layer.shadowOpacity = 0.07
        shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 4)
        shadowView.layer.shadowRadius = 1.8
        shadowView.backgroundColor = AppColors.lightGray
        shadowView.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
        shadowView.frame = CGRect(
            origin: CGPoint(x: 0, y: bounds.height - 10),
            size: CGSize(width: bounds.width, height: 10))
    }
    
    func shadowActive(with alpha: CGFloat) {
        shadowView.alpha = alpha
    }
}

extension SectionsCollectioonViewHeader: SectionsCollectionViewProtocol {
    func didTapToCell(with indexPath: IndexPath) {
        answerDelegate?.didTapToCell(with: indexPath)
    }
}
