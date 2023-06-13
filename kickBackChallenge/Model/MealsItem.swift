//
//  MealsItem.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 17.04.2023.
//

import Foundation

struct MealsDetail: Codable, Hashable {
    let meals: [MealsItem]?
}

struct MealsItem: Codable, Identifiable, Hashable {
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
    let ingredients: [Ingredient]?
}

struct Ingredient: Codable, Hashable {
    let name: String
    let measure: String
}

extension MealsItem {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDict = try container.decode([String: String?].self)
        var index = 1
        var ingredients: [Ingredient] = []
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

extension MealsItem {
    static let mealsTest = MealsItem(idMeal: "52895", strMeal: "English Breakfast", strCategory: "Breakfast", strArea: "British", strInstructions: "Heat the flat grill plate over a low heat, on top of 2 rings/flames if it fits, and brush sparingly with light olive oil.\r\nCook the sausages first. Add the sausages to the hot grill plate/the coolest part if there is one and allow to cook slowly for about 15-20 minutes, turning occasionally, until golden. After the first 10 minutes, increase the heat to medium before beginning to cook the other ingredients. If you are struggling for space, completely cook the sausages and keep hot on a plate in the oven.\r\nSnip a few small cuts into the fatty edge of the bacon. Place the bacon straight on to the grill plate and fry for 2-4 minutes each side or until your preferred crispiness is reached. Like the sausages, the cooked bacon can be kept hot on a plate in the oven.\r\nFor the mushrooms, brush away any dirt using a pastry brush and trim the stalk level with the mushroom top. Season with salt and pepper and drizzle over a little olive oil. Place stalk-side up on the grill plate and cook for 1-2 minutes before turning and cooking for a further 3-4 minutes. Avoid moving the mushrooms too much while cooking, as this releases the natural juices, making them soggy.\r\nFor the tomatoes, cut the tomatoes across the centre/or in half lengthways if using plum tomatoes , and with a small, sharp knife remove the green 'eye'. Season with salt and pepper and drizzle with a little olive oil. Place cut-side down on the grill plate and cook without moving for 2 minutes. Gently turn over and season again. Cook for a further 2-3 minutes until tender but still holding their shape.\r\nFor the black pudding, cut the black pudding into 3-4 slices and remove the skin. Place on the grill plate and cook for 1½-2 minutes each side until slightly crispy.\r\nFor 'proper' fried bread it's best to cook it in a separate pan. Ideally, use bread that is a couple of days old. Heat a frying pan to a medium heat and cover the base with oil. Add the bread and cook for 2-3 minutes each side until crispy and golden. If the pan becomes too dry, add a little more oil. For a richer flavour, add a knob of butter after you turn the slice.\r\nFor the fried eggs, break the egg straight into the pan with the fried bread and leave for 30 seconds. Add a good knob of butter and lightly splash/baste the egg with the butter when melted. Cook to your preferred stage, season and gently remove with a fish slice.\r\nOnce all the ingredients are cooked, serve on warm plates and enjoy straight away with a good squeeze of tomato ketchup or brown sauce.", strMealThumb: "https://www.themealdb.com/images/media/meals/utxryw1511721587.jpg", strTags: "Breakfast", strYoutube: "https://www.youtube.com/watch?v=FXjYU2Ensck", strSource: "https://www.bbc.co.uk/food/recipes/stressfreefullenglis_67721", ingredients: [
            Ingredient(name: "Sausages", measure: "2"),
            Ingredient(name: "Bacon", measure: "3"),
            Ingredient(name: "Mushrooms", measure: "2"),
            Ingredient(name: "Tomatoes", measure: "2"),
            Ingredient(name: "Black Pudding", measure: "1 Slice"),
            Ingredient(name: "Eggs", measure: "2"),
            Ingredient(name: "Bread", measure: "1 Slice"),
        ])
}
