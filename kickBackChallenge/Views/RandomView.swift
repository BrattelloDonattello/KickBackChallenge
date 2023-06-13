//
//  RandomView.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 17.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct RandomView: View {
    @EnvironmentObject var vm: ViewModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                NavBarRandom(title: "What are we cooking", subTitle: "today?")
                
                mainWrapper
                    .onAppear {
                        vm.getRandomMeals()
                        favoriteVM.favorite = false
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    @ViewBuilder
    var mainWrapper: some View {
        ScrollView(showsIndicators: false) {
            ForEach(vm.model) { meals in
                HStack(alignment: .top) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("bgSec"))
                            .frame(width: 200, height: 200)
                        WebImage(url: URL(string: meals.strMealThumb ?? ""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 190, height: 190)
                            .clipShape(Circle())
                    }
                    Spacer()
                    Button {
                        if self.favoriteVM.favorite {
                            self.favoriteVM.removeFromFavorite(meals: meals)
                            self.favoriteVM.favorite.toggle()
                        } else {
                            self.favoriteVM.addToFavorite(meals: meals)
                            self.favoriteVM.favorite.toggle()
                        }
                    } label: {
                        Image("hearts")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(favoriteVM.favorite ? Color.red : Color("textMain"))
                            .frame(width: 30, height: 30)
                    }

                }
                .padding(.horizontal)
                
                HStack {
                    Text(meals.strMeal ?? "")
                        .font(.gilroy(.bold, size: 20))
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical)
                
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(meals.ingredients ?? [], id: \.self) { ing in
                            HStack {
                                Circle()
                                    .foregroundColor(Color("textSec"))
                                    .frame(width: 10, height: 10)
                                Text("\(ing.name):")
                                Text(ing.measure)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.horizontal)
                }
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            Text(meals.strInstructions ?? "")
                                .font(.gilroy(.medium, size: 13))
                                .padding(10)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 70)
            }
        }
    }
}

//struct RandomView_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomView()
//    }
//}

struct NavBarRandom: View {
    var title: String
    var subTitle: String
    var body: some View {
        HStack {
            Text(title)
                .font(.gilroy(.medium, size: 20))
            Text(subTitle)
                .font(.gilroy(.bold, size: 20))
        }
        .foregroundColor(Color("textMain"))
        .padding(.horizontal)
        .padding(.vertical)
    }
}
