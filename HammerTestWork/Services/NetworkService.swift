//
//  NetworkService.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 07.01.2022.
//

import UIKit

protocol NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[MenuModel], Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[MenuModel], Error>) -> Void) {
        
        
        
        
        
        
        
        
        
        
        
        
        
        for i in 0..<50 {
            menu.append(MenuModel(name: "\(i + 10)", about: "", minPrice: 345 + i, image: nil))
        }
        completion(.success(menu))
    }
}

private var menu = [
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
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Ветчина и грибы5",
        about: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
        minPrice: 345,
        image: UIImage.init(named: "pizza")),
    MenuModel(
        name: "Ветчина и грибы5",
        about: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
        minPrice: 345,
        image: UIImage.init(named: "pizza"))
]


