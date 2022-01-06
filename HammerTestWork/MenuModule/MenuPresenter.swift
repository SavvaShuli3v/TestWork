//
//  MenuPresenter.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

protocol MenuViewOutput {
    
}

protocol MenuViewInput: AnyObject {
    
}

import Foundation

final class MenuPresenter {
    weak var view: MenuViewInput?
    
    init() {
        
    }
}

extension MenuPresenter: MenuViewOutput {
    
}


