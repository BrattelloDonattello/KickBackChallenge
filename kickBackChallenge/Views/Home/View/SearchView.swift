//
//  SearchView.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 17.04.2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchVM = SearchViewModel()
    
    @EnvironmentObject var mealsCategory: ViewModel
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            NavigationStack {
                VStack {
                    NavBarRandom(title: "Find your tasty", subTitle: "meals!")
                    searchBar
                    
                    category
                    
                    mainWrapper
                }
                .sheet(isPresented: $searchVM.isTapperd, content: {
                    NavigationStack {
                        SearchSheetView()
                    }
                })
                .navigationDestination(for: Meal.self, destination: { meal in
                    SearchDetailView(searchDetailVM: DetailViewModel(categoryDescr: meal), idMeal: meal.idMeal ?? "52772")
                })
            }
            .onChange(of: mealsCategory.categorySelected, perform: { category in
                mealsCategory.getCategories(category: category)
            })
            .task {
                mealsCategory.getCategories(category: mealsCategory.categorySelected)
            }
        }
    }
    
    @ViewBuilder
    var searchBar: some View {
        SearchRow(search: searchVM.search)
            .onTapGesture {
                searchVM.isTapperd.toggle()
            }
    }
    
    @ViewBuilder
    var category: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(ViewModel.CategoryMeals.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .foregroundColor(mealsCategory.categorySelected != category.rawValue ? Color("textMain") : Color.white)
                        .font(.gilroy(.bold, size: 18))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background {
                            if mealsCategory.categorySelected == category.rawValue {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("textMain"))
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                mealsCategory.categorySelected = category.rawValue
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 50)
    }
    
    @ViewBuilder
    var mainWrapper: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 25) {
                ForEach(mealsCategory.categoryMeals, id: \.self) { meals in
                    NavigationLink(value: meals) {
                        CategoryCard(categoryMeal: mealsCategory.categorySelected, category: meals)
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
