//
//  FavoriteView.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 17.04.2023.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            VStack {
                NavBarRandom(title: "Here is your favorite", subTitle: "meals?")
                
                mainWrapper
            }
        }
    }
    @ViewBuilder
    var mainWrapper: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(favoriteVM.favoriteRecipe) { fav in
                    if favoriteVM.favoriteRecipe.count == 0 {
                        Text("Pizda")
                    } else {
                        FavoriteCards(reciep: fav)
                    }
                }
            }
            .padding()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
