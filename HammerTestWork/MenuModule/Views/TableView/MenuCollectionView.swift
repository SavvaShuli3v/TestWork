//
//  MenuCollectionView.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuCollectionView: UICollectionView {
    
    init() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.sectionHeadersPinToVisibleBounds = true
        super.init(frame: .zero, collectionViewLayout: collectionViewLayout)
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        dataSource = self
        delegate = self
        register(MainNewsCollectionViewCell.self)
        register(MenuCell.self)
        register(SectionsCollectioonViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        true
    }
}

extension MenuCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            preconditionFailure()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell: MainNewsCollectionViewCell = dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: MenuCell = dequeueReusableCell(for: indexPath)
            return cell
        default:
            preconditionFailure()
        }
    }
}

extension MenuCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: bounds.width, height: 135)
        case 1:
            return CGSize(width: bounds.width, height: 180)
        default:
            preconditionFailure()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: headerID,
            for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: 0, height: 0)
        case 1:
            return CGSize(width: bounds.width, height: 100)
        default:
            preconditionFailure()
        }
    }
}

private let headerID = "headerID"
