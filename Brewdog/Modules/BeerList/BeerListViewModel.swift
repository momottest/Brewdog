//
//  BeerListViewModel.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

protocol BeerListViewModelProtocol {
    
}

final class BeerListViewModel: BeerListViewModelProtocol {
    private let api: API
    
    init(with api: API) {
        self.api = api
    }
}
