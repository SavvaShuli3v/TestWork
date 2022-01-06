//
//  MenuCollectionView.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuCollectionView: UICollectionView {
    
    private var menu = [MenuModel]()
    
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
    
    func setMenu(menu: [MenuModel]) {
        self.menu = menu
        reloadData()
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
            return menu.count
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
            cell.setMenuPosition(with: menu[indexPath.row])
            cell.setIndexPath(with: indexPath.row)
            
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
            return CGSize(width: bounds.width, height: 148)
        case 1:
            let text = menu[indexPath.row].about
            let heightOfText = text.height(
                constraintedWidth: bounds.width - 204,
                font: UIFont.systemFont(
                    ofSize: 13,
                    weight: .regular
                )
            )
            
            let heightOfCell = heightOfText + 132
            return CGSize(width: bounds.width, height: heightOfCell)
        default:
            preconditionFailure()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
            return CGSize(width: bounds.width, height: 66)
        default:
            preconditionFailure()
        }
    }
}

private let headerID = "headerID"
