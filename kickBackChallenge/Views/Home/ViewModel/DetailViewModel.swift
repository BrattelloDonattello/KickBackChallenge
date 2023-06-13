//
//  DetailViewModel.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 20.04.2023.
//

import Foundation
import Alamofire

class DetailViewModel: ObservableObject {
    
    var categoryDescr: Meal
    @Published var meals: [MealsItem] = []
    @Published var mealsT: [MealsItem] = []
    
    init(categoryDescr: Meal) {
        self.categoryDescr = categoryDescr
    }
    
    func getDetailMeal(idMeal: String) {
        guard let url = URL(string: "\(Constants.url)lookup.php") else { return }
        let params: Parameters = [
            "i": idMeal
        ]
        AF.request(url, parameters: params).responseData { data in
            switch data.result {
            case .failure(let error):
                print("DETAIL -- \(error)")
            case .success(let value):
                do {
                    let resp = try JSONDecoder().decode(MealsDetail.self, from: value)
                    guard let datas = resp.meals else { return }
                    self.meals = datas
                } catch let erorr {
                    print(erorr.localizedDescription)
                }
            }
        }
    }
}
