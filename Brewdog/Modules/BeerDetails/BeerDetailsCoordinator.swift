//
//  BeerDetailsCoordinator.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

final class BeerDetailsCoordinator: BaseCoordinator {
    private let presenter: UINavigationController
    private let beer: Beer
    private var detailsViewController: BeerDetailsViewController?

    init(presenter: UINavigationController, beer: Beer) {
        self.presenter = presenter
        self.beer = beer
    }
    
    override func start() {
        let viewModel = BeerDetailsViewModel(with: beer)
        let viewController = instantiate(BeerDetailsViewController.self)
        viewController.viewModel = viewModel
        viewController.title = beer.name
        
        presenter.pushViewController(viewController, animated: true)
        
        self.detailsViewController = viewController
    }
}
