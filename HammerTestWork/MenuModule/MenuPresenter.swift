//
//  MenuPresenter.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 06.01.2022.
//

import UIKit

protocol MenuViewOutput {
    func viewDidLoad()
}

protocol MenuViewInput: AnyObject {
    func setData(with menu: [MenuModel])
}

import Foundation

final class MenuPresenter {
    weak var view: MenuViewInput?
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}

extension MenuPresenter: MenuViewOutput {
    func viewDidLoad() {
        networkService.getMOCData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let menu):
                    self?.view?.setData(with: menu)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
