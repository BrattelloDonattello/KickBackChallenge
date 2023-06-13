//
//  SearchSheetView.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 20.04.2023.
//

import SwiftUI

struct SearchSheetView: View {
    @EnvironmentObject var vm: ViewModel
    @State var search: String = ""
    
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            VStack {
                Capsule()
                    .foregroundColor(Color("textMain"))
                    .frame(width: 60, height: 5)
                    .padding(.vertical, 10)
                SearchSheet(searchMeal: $search)
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(vm.search, id: \.self) { meals in
                            NavigationLink(value: meals) {
                                SearchCard(meals: meals)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
        }
        .navigationDestination(for: MealsItem.self, destination: { meal in
            FavoriteDetailView(meals: meal)
                .navigationBarBackButtonHidden()
        })
        .onChange(of: search) { newValue in
            Task {
                vm.getSearch(search: newValue)
            }
        }
    }
}

struct SearchSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheetView()
    }
}

struct SearchSheet: View {
    @Binding var searchMeal: String
    var body: some View {
        HStack {
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            TextField("Search", text: $searchMeal)
        }
        .padding(10)
        .background(Color("textSec").opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}
