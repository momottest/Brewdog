//
//  BeerListViewController.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

final class BeerListViewController: BaseViewController {
    
    @IBOutlet private weak var listTableView: UITableView!
    var viewModel: BeerListViewModelProtocol?
    var onShowDetails: ((Beer) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        binding()
    }
    
    private func binding() {
        
    }
    
}
