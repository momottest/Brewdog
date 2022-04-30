//
//  BeerListViewModel.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

protocol BeerListViewModelProtocol {
    func search()

    var beers: Bindable<[Beer]> { get }
    var error: Bindable<Error> { get }
}

final class BeerListViewModel: BeerListViewModelProtocol {
    
    private let api: API
    var beers = Bindable<[Beer]>()
    var error = Bindable<Error>()
    
    init(with api: API) {
        self.api = api
    }
    
    func search() {
        let request = BeersRequest()
        api.send(request) {[weak self] result  in
            switch result {
            case .success(let response):
                self?.beers.value = response
            case .failure(let error):
                self?.error.value = error
            }
        }
        
    }
}
