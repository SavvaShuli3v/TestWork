//
//  AppCoordinator.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

final class AppCoordinator {
    private let window = UIWindow(frame: UIScreen.main.bounds)
    
    func startWithMenu() {
        let container = MenuContainer.assembly()
        window.rootViewController = container.viewController
        window.makeKeyAndVisible()
    }
}
