//
//  BeerListCoordinator.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

final class BeerListCoordinator: BaseCoordinator {
    private let presenter: UINavigationController
    private let api: API
    private var listViewController: BeerListViewController?
    private var detailsCoordinator: BeerDetailsCoordinator?
    
    init(presenter: UINavigationController, api: API) {
        self.presenter = presenter
        self.api = api
    }
    
    override func start() {
        let viewModel = BeerListViewModel(with: api)
        let viewController = instantiate(BeerListViewController.self)
        viewController.viewModel = viewModel
        viewController.title = "Brewdog"
        viewController.onShowDetails = {[weak self] beer in
            DispatchQueue.main.async {
                self?.showDetails(with: beer)
            }
        }
        
        presenter.pushViewController(viewController, animated: true)
        
        self.listViewController = viewController
    }
}

extension BeerListCoordinator {
    
    func showDetails(with beer: Beer) {
        let detailsCoordinator = BeerDetailsCoordinator(presenter: presenter, beer: beer)
        detailsCoordinator.start()

        self.detailsCoordinator = detailsCoordinator
    }
}
