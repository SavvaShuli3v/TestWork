//
//  MenuViewController.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuViewController: UIViewController {
    
    private lazy var menuTableView = MenuTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuTableView.frame = view.bounds
    }
}
