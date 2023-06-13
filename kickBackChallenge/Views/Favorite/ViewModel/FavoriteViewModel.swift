//
//  FavoriteViewModel.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 19.04.2023.
//

import Foundation
import SwiftUI

final class FavoriteViewModel: ObservableObject {
    @Published var favoriteRecipe: [MealsItem] = []
    @Published var favorite: Bool = false
    
    
    let defaults = UserDefaults.standard
    let keyFavorites = "KEY_FAV"
    
    init() {
        getItems()
    }
}

extension FavoriteViewModel {
    func addToFavorite(meals: MealsItem) {
        favoriteRecipe.append(meals)
    }
    
    func removeFromFavorite(meals: MealsItem) {
        if let index = favoriteRecipe.firstIndex(of: meals) {
            favoriteRecipe.remove(at: index)
        }
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: keyFavorites) else { return }
    }
}
