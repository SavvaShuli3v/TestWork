//
//  MenuViewController.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuViewController: UIViewController {
    private let output: MenuViewOutput
    
    init(output: MenuViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var menuTableView = MenuTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuTableView.frame = view.bounds
    }
}

extension MenuViewController: MenuViewInput {
    
}
