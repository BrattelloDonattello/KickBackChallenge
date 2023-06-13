//
//  SearchCard.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 20.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchCard: View {
    var meals: MealsItem
    var body: some View {
        HStack(alignment: .top) {
            WebImage(url: URL(string: meals.strMealThumb ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .background(.green)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(meals.strMeal ?? "")
                    .foregroundColor(.black)
                    .font(.gilroy(.bold, size: 17))
                    .lineLimit(2)
                Spacer()
                HStack {
                    Text("Category:")
                        .foregroundColor(Color("textSec"))
                        .font(.gilroy(.medium, size: 12))
                    Text(meals.strCategory ?? "")
                        .foregroundColor(Color("textMain"))
                        .font(.gilroy(.bold, size: 14))
                }
            }
            .frame(alignment: .leading)
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
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10, x: 10, y: 10)
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct SearchCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchCard(meals: MealsItem(idMeal: "", strMeal: "", strCategory: "", strArea: "", strInstructions: "", strMealThumb: "", strTags: "", strYoutube: "", strSource: "", ingredients: [Ingredient(name: "", measure: "")]))
    }
}
