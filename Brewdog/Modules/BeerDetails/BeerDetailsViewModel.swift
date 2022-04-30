//
//  BeerDetailsViewModel.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

protocol BeerDetailsViewModelProtocol {
    
}

final class BeerDetailsViewModel: BeerDetailsViewModelProtocol {
    let beer: Beer
    
    init(with beer: Beer) {
        self.beer = beer
    }
}
