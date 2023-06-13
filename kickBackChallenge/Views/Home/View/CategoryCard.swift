//
//  CategoryCard.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 19.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCard: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    
    var categoryMeal: String
    var category: Meal
    var body: some View {
        ZStack(alignment: .top) {
            WebImage(url: URL(string: category.strMealThumb ?? "https://www.themealdb.com/images/media/meals/1548772327.jpg"))
                .resizable()
                .scaledToFill()
                .frame(width: 167, height: 215)
                .background(Color("tabBarBg"))
            VStack(alignment: .leading) {
                HStack {
                    Text(categoryMeal)
                        .foregroundColor(Color("textMain"))
                        .font(.gilroy(.semiBold, size: 10))
                        .textCase(.uppercase)
                    Spacer()
                    
                    Button {
//                        if self.favoriteVM.favorite {
//                            self.favoriteVM.removeFromFavorite(meals: category)
//                            self.favoriteVM.favorite.toggle()
//                        } else {
//                            self.favoriteVM.addToFavorite(meals: category)
//                            self.favoriteVM.favorite.toggle()
//                        }
                    } label: {
                        Image("hearts")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("textMain"))
                            .scaledToFit()
                        .frame(width: 20, height: 20)
                    }
                }
                Text(category.strMeal ?? "Baked salmon with fennel & tomatoes")
                    .foregroundColor(.white)
                    .font(.gilroy(.bold, size: 16))
                    .lineLimit(2)
                    .padding(.top, 12)
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: 167, maxHeight: 215)
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .shadow(color: Color("shadowCard"), radius: 10, x: 10, y: 10)
    }
}

//struct CategoryCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryCard()
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .padding()
//            .previewDisplayName("Default preview")
//    }
//}
