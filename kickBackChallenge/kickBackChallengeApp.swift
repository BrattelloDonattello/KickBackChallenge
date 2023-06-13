//
//  kickBackChallengeApp.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 16.04.2023.
//

import SwiftUI

@main
struct kickBackChallengeApp: App {
    @StateObject var vm = ViewModel()
    @StateObject var favoriteVM = FavoriteViewModel()
    var body: some Scene {
        WindowGroup {
//            NavigationView {
                CustomTabBar()
                    .environmentObject(vm)
                    .environmentObject(favoriteVM)
//            }
        }
    }
}
