//
//  SectionsCollectionView.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

protocol SectionsCollectionViewProtocol: AnyObject {
    func didTapToCell(with indexPath: IndexPath)
}

final class SectionsCollectionView: UICollectionView {
    weak var answerDelegate: SectionsCollectionViewProtocol?
    private var previousActiveContext = IndexPath(item: 0, section: 0)
    
    // MARK: - Init
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        backgroundColor = AppColors.lightGray
        showsHorizontalScrollIndicator = false
        register(SectionCollectionViewCell.self)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        true
    }
}

extension SectionsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return context.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SectionCollectionViewCell = dequeueReusableCell(for: indexPath)
        cell.setTitle(with: context[indexPath.row])
        if previousActiveContext == indexPath {
            cell.setActiveContext()
        } else {
            cell.removePreviousContext()
        }
        return cell
    }
    
}

extension SectionsCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = context[indexPath.row]
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)
        ])
        
        let height = self.frame.height
        
        return CGSize(width: itemSize.width + 56, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        answerDelegate?.didTapToCell(with: indexPath)
        
        if previousActiveContext != indexPath {
            weak var cell = cellForItem(at: indexPath) as? SectionCollectionViewCell
            cell?.setActiveContext()
        }
        
        if previousActiveContext != indexPath {
            weak var previousCell = cellForItem(at: previousActiveContext) as? SectionCollectionViewCell
            previousCell?.removePreviousContext()
            
            previousActiveContext = indexPath
        }
    }
    
}

private let context = [
    Localization.pizza,
    Localization.combo,
    Localization.desserts,
    Localization.beverages,
    Localization.sauces,
    Localization.childrensMenu
]

