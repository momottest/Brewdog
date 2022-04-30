//
//  AppCoordinator.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    let api: API
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private let beerListCoordinator: BeerListCoordinator
    
    // MARK: - Place to declare initial viewCOntroller
    init(window: UIWindow) {
        self.window = window
        api = AppAPI()
        rootViewController = UINavigationController()
        
        beerListCoordinator = BeerListCoordinator(presenter: rootViewController, api: api)
    }
    
    func start() {
        window.rootViewController = rootViewController
        beerListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
