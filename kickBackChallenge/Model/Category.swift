//
//  Category.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 19.04.2023.
//

import Foundation

struct Category: Codable, Hashable {
    let meals: [Meal]?
}

struct Meal: Codable, Hashable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}
