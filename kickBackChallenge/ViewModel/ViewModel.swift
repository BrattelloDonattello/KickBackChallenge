//
//  ViewModel.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 17.04.2023.
//

import Foundation
import Alamofire

class ViewModel: ObservableObject {
    
    enum CategoryMeals: String, CaseIterable {
        case Beef = "Beef"
        case Chicken = "Chicken"
        case Desert = "Dessert"
        case Lamb = "Lamb"
        case Miscellaneous = "Miscellaneous"
        case Pasta = "Pasta"
        case Pork = "Pork"
        case Seafood = "Seafood"
        case Side = "Side"
        case Starter = "Starter"
        case Vegan = "Vegan"
        case Vegetarian = "Vegetarian"
        case Breakfast = "Breakfast"
        case Goat = "Goat"
    }
    
    @Published var categorySelected = "Beef"
    @Published var sortType: CategoryMeals = .Beef
    
    @Published var categoryMeals: [Meal] = []
    @Published var model: [MealsItem] = []
    @Published var search: [MealsItem] = []
    
    func getCategories(category: String) {
        guard let url = URL(string: "\(Constants.url)filter.php") else { return }
        let params: Parameters = [
            "c": "\(category)"
        ]
        AF.request(url, parameters: params).responseData { data in
            switch data.result {
            case .failure(let erorr):
                print(erorr)
            case .success(let value):
                do {
                    let resp = try JSONDecoder().decode(Category.self, from: value)
                    guard let datas = resp.meals else { return print("EROR BLEA") }
                    self.categoryMeals = datas
                } catch let error {
                    print(error)
                }
            }
        }
    }
    
    func getRandomMeals() {
        guard let url = URL(string: "\(Constants.url)random.php") else { return }
        AF.request(url).responseData { data in
            switch data.result {
            case .failure(let erorr):
                print("ERORR -- \(erorr)")
            case .success(let value):
                do {
                    let resp = try JSONDecoder().decode(Meals.self, from: value)
                    guard let datas = resp.meals else { return }
                    self.model = datas
                } catch let error {
                    print("TUT ERORR -- \(error)")
                }
            }
        }
    }
    
    
    func getSearch(search: String) {
        guard let url = URL(string: "\(Constants.url)search.php") else { return }
        let params: Parameters = [
            "s": "\(search)"
        ]
        AF.request(url, parameters: params).responseData { data in
            switch data.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                do {
                    let resp = try JSONDecoder().decode(Meals.self, from: value)
                    guard let datas = resp.meals else { return }
                    self.search = datas
                } catch let error {
                    print(error)
                }
            }
        }
    }
}
