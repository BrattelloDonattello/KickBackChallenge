//
//  FavoriteMeals.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 19.04.2023.
//

import Foundation

struct FavoriteMeals: Codable, Identifiable, Hashable {
    let id = UUID()
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strSource: String?
    let ingredients: [IngredientFavorite]?
}

struct IngredientFavorite: Codable, Hashable {
    let name: String
    let measure: String
}

extension FavoriteMeals {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDict = try container.decode([String: String?].self)
        var index = 1
        var ingredients: [IngredientFavorite] = []
        while let ingredient = mealDict["strIngredient\(index)"] as? String,
              let measure = mealDict["strMeasure\(index)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            ingredients.append(.init(name: ingredient, measure: measure))
            index += 1
        }//: while
        self.ingredients = ingredients
        
        idMeal = mealDict["idMeal"] as? String ?? ""
        strMeal = mealDict["strMeal"] as? String ?? ""
        strCategory = mealDict["strCategory"] as? String ?? ""
        strArea = mealDict["strArea"] as? String ?? ""
        strInstructions = mealDict["strInstructions"] as? String ?? ""
        strMealThumb = mealDict["strMealThumb"] as? String ?? ""
        strTags = mealDict["strTags"] as? String ?? ""
        strYoutube = mealDict["strYoutube"] as? String ?? ""
        strSource = mealDict["strSource"] as? String ?? ""
    }
}

