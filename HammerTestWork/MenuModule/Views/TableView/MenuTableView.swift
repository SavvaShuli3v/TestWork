//
//  MenuTableView.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = AppColors.lightGray
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        delegate = self
        dataSource = self
        register(NewsTableViewCell.self)
        register(MainMenuCell.self)
        
        register(SectionsTableViewHeader.self, forHeaderFooterViewReuseIdentifier: headerID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            preconditionFailure()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: NewsTableViewCell = dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: MainMenuCell = dequeueReusableCell(for: indexPath)
            return cell
        default:
            preconditionFailure()
        }
    }
}

extension MenuTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 135
        case 1:
            return 180
        default:
            preconditionFailure()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        case 1:
            let header = dequeueReusableHeaderFooterView(withIdentifier: headerID) as! SectionsTableViewHeader
            return header
        default:
            preconditionFailure()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 60
        default:
            preconditionFailure()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
}

private let headerID = "header"
