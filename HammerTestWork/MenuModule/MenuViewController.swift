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
    private lazy var menuCollectionView = MenuCollectionView()
    private lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
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
        view.addSubview(menuCollectionView)
        setActivityIndicator()
        activityIndicator.startAnimating()
        menuCollectionView.alpha = 0
        output.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuHeader.frame = CGRect(
            origin: CGPoint(x: 0, y: view.safeAreaInsets.top),
            size: CGSize(width: view.bounds.width, height: headerHeight)
        )
        
        
        menuCollectionView.frame = CGRect(
            origin: CGPoint(x: 0, y: view.safeAreaInsets.top + headerHeight),
            size: CGSize(
                width: view.bounds.width,
                height: view.bounds.height - headerHeight
            )
        )
    }
}

extension MenuViewController: MenuViewInput {
    func setData(with menu: [MenuModel]) {
        activityIndicator.stopAnimating()
        menuCollectionView.alpha = 1
        menuCollectionView.setMenu(menu: menu)
    }
}

private extension MenuViewController {
    func setActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.width(10)
        activityIndicator.height(10)
    }
}

private let headerHeight: CGFloat = 56
