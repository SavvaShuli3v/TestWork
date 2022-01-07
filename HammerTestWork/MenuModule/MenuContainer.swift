//
//  MenuContainer.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class MenuContainer {
    var viewController: UIViewController
    
    class func assembly() -> MenuContainer {
        let networkService = NetworkService()
        let presenter = MenuPresenter(networkService: networkService)
        let viewController = MenuViewController(output: presenter)
        
        presenter.view = viewController
        return MenuContainer(viewController: viewController)
    }
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
