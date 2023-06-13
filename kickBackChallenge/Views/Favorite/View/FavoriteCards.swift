//
//  FavoriteCards.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 19.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteCards: View {
    var reciep: MealsItem
    
    var body: some View {
        HStack(alignment: .top) {
            WebImage(url: URL(string: reciep.strMealThumb ?? ""))
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(reciep.strMeal ?? "")
                    .foregroundColor(.black)
                    .font(.gilroy(.bold, size: 17))
                    .lineLimit(2)
                Spacer()
                Text(reciep.strCategory ?? "")
                    .foregroundColor(Color("textSec"))
                    .font(.gilroy(.medium, size: 12))
            }
            .frame(alignment: .leading)
            .padding(.vertical, 3)
            Spacer()
            Image("hearts")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.red)
                .frame(width: 30, height: 30)
        }
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10, x: 10, y: 10)
    }
}

//struct FavoriteCards_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteCards()
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .padding()
//            .previewDisplayName("Default preview")
//    }
//}
