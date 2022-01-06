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
    
    init() {
        
    }
}

extension MenuPresenter: MenuViewOutput {
    func viewDidLoad() {
        view?.setData(with: data)
    }
}

private let data = [
    MenuModel(
        name: "Ветчина и грибы",
        about: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
        minPrice: 345,
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Баварские колбаски",
        about: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
        minPrice: 345,
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Нежный лосось",
        about: "Лосось, томаты черри, моцарелла, соус песто",
        minPrice: 345,
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Пицца четыре сыра",
        about: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
        minPrice: 345,
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Ветчина и грибы2",
        about: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
        minPrice: 345,
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Ветчина и грибы3",
        about: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
        minPrice: 345,
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Ветчина и грибы4",
        about: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
        minPrice: 345,
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Ветчина и грибы5",
        about: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
        minPrice: 345,
        image: UIImage.init(named: "pizza"))
]
