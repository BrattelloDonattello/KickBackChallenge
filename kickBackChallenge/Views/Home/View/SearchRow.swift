//
//  SearchRow.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 20.04.2023.
//

import SwiftUI

struct SearchRow: View {
    @State var search = ""
    var body: some View {
        HStack {
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            TextField("Search", text: $search)
        }
        .padding(10)
        .background(Color("textSec").opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow()
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
