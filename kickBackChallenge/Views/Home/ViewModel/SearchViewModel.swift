//
//  SearchViewModel.swift
//  kickBackChallenge
//
//  Created by Ciupac Cristian  on 20.04.2023.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var search = ""
    @Published var isTapperd: Bool = false
}
