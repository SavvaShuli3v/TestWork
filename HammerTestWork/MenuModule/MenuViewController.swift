//
//  MenuViewController.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuViewController: UIViewController {
    private let output: MenuViewOutput
    
    private lazy var menuHeader = MenuHeader()
    private lazy var menuTableView = MenuTableView()
    
    init(output: MenuViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.lightGray
        view.addSubview(menuHeader)
        view.addSubview(menuTableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuHeader.frame = CGRect(
            origin: CGPoint(x: 0, y: view.safeAreaInsets.top),
            size: CGSize(width: view.bounds.width, height: headerHeight)
        )
        
        
        menuTableView.frame = CGRect(
            origin: CGPoint(x: 0, y: view.safeAreaInsets.top + headerHeight),
            size: CGSize(width: view.bounds.width, height: view.bounds.height - headerHeight))
    }
}

extension MenuViewController: MenuViewInput {
    
}

private let headerHeight: CGFloat = 56
