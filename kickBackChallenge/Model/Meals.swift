//
//  Meals.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 17.04.2023.
//

import Foundation

struct Meals: Identifiable, Codable {
    let id = UUID()
    let meals: [MealsItem]?
}
