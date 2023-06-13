//
//  FavoriteDetailView.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 19.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteDetailView: View {
    var meals: MealsItem
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            VStack {
                capsule
                
                mainWrapper
            }
        }
    }
    @ViewBuilder
    var capsule: some View {
        Capsule()
            .foregroundColor(Color("textMain"))
            .frame(width: 60, height: 5)
            .padding(.vertical, 10)
    }
    
    @ViewBuilder
    var mainWrapper: some View {
        ScrollView(showsIndicators: false) {
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
                        //
                    } label: {
                        Image("hearts")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("textMain"))
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

struct FavoriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteDetailView(meals: .mealsTest)
            .environmentObject(ViewModel())
    }
}
