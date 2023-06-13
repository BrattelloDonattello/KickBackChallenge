//
//  CustomTabBar.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 17.04.2023.
//

import SwiftUI

struct CustomTabBar: View {
    @State var selectedTab: Tabs = .search
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            tabGroup
            
            mainWrapper
        }
    }
    @ViewBuilder
    var tabGroup: some View {
        Group {
            switch selectedTab {
            case .search:
                SearchView()
            case .random:
                RandomView()
            case .favorite:
                FavoriteView()
            }
        }
    }
    
    @ViewBuilder
    var mainWrapper: some View {
        HStack(spacing: 0) {
            Button {
                withAnimation {
                    selectedTab = .search
                }
            } label: {
                Image("search")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(selectedTab == .search ? Color("textMain") : Color("textSec"))
                    .frame(width: 25, height: 25)
                if selectedTab == .search {
                    withAnimation {
                        Text("Search")
                            .foregroundColor(selectedTab == .search ? Color("textMain") : Color("textSec"))
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
            }
            .padding(10)
            .background(selectedTab == .search ? Color("tabBarBg") : Color("bgSec"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
            
            Button {
                withAnimation {
                    selectedTab = .random
                }
            } label: {
                Image("random")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(selectedTab == .random ? Color("textMain") : Color("textSec"))
                    .frame(width: 25, height: 25)
                if selectedTab == .random {
                    withAnimation {
                        Text("Random")
                            .foregroundColor(selectedTab == .random ? Color("textMain") : Color("textSec"))
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
            }
            .padding(10)
            .background(selectedTab == .random ? Color("tabBarBg") : Color("bgSec"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
            
            Button {
                withAnimation {
                    selectedTab = .favorite
                }
            } label: {
                Image("hearts")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(selectedTab == .favorite ? Color("textMain") : Color("textSec"))
                    .frame(width: 25, height: 25)
                if selectedTab == .favorite {
                    withAnimation {
                        Text("Favorite")
                            .foregroundColor(selectedTab == .favorite ? Color("textMain") : Color("textSec"))
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
            }
            .padding(10)
            .background(selectedTab == .favorite ? Color("tabBarBg") : Color("bgSec"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(Color("bgSec"))
        .ignoresSafeArea()
    }
}

//struct CustomTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabBar()
//    }
//}

enum Tabs: String, CaseIterable {
    case search, random, favorite
}
