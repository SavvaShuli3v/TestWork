//
//  NetworkService.swift
//  HammerTestWork
//
//  Created by Савва Шулятьев on 07.01.2022.
//

import UIKit

protocol NetworkServiceProtocol {
    func getMOCData(completion: @escaping (Result<[MenuModel], Error>) -> Void)
    func getCoctail(completion: @escaping (Result<SimpleModel, Error>) -> Void)
    func getImage(from urlString: String, completion: @escaping (Result<UIImage?, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func getMOCData(completion: @escaping (Result<[MenuModel], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            for i in 0..<50 {
                menu.append(MenuModel(name: "\(i + 10)", about: "", minPrice: 345 + i, image: nil))
            }
            completion(.success(menu))
        })
    }
    
    func getCoctail(completion: @escaping (Result<SimpleModel, Error>) -> Void) {
        //let tocken = Tocken.tockenString
        let URLString = ""
        
        guard let url = URL(string: URLString) else {
            completion(.failure(CustomError.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data,
               (response as? HTTPURLResponse)?.statusCode == 200 {
                
                do {
                    let model = try JSONDecoder().decode(SimpleModel.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                    print("JSON pasrsing error: " + error.localizedDescription)
                }
            } else {
                completion(.failure(CustomError.unexpectedError))
            }
        }
        dataTask.resume()
    }
    
    func getImage(from urlString: String, completion: @escaping (Result<UIImage?, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        getData(from: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            completion(.success(UIImage(data: data)))
        }

    }
    
}

private extension NetworkServiceProtocol {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
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

enum CustomError: Error {
    case invalidURL
    case unexpectedError
}
