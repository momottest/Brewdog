//
//  BeerDetailsViewController.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

final class BeerDetailsViewController: BaseViewController {
    
    @IBOutlet private weak var imageView: LoadableImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var abvLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: BeerDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureView()
    }
    
    private func configureTableView() {
        let reuseId = String(describing: DetailCell.self)
        let cellNib = UINib(nibName: reuseId, bundle: Bundle(for: DetailCell.self))
        tableView.register(cellNib, forCellReuseIdentifier: reuseId)
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
    }
    
    private func configureView() {
        descriptionLabel.text = viewModel?.beer.description
        if let abv = viewModel?.beer.abv {
            abvLabel.text = "ABV: \(abv) %"
        }
        if let imageUrl = viewModel?.beer.image {
            imageView.loadImageWithUrl(urlString: imageUrl)
        }
    }
}

// MARK: - UITableViewDataSource
extension BeerDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = viewModel?.sections, sections.count > section else { return nil }
        return sections[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = viewModel?.sections[section] else { return 0 }
        switch section {
        case .hops:
            return viewModel?.beer.ingredients?.hops.count ?? 0
        case .malts:
            return viewModel?.beer.ingredients?.malt.count ?? 0
        case .methods:
            return viewModel?.beer.method?.availableMethods.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseId = String(describing: DetailCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? DetailCell else {
            return UITableViewCell()
        }
        
        let data = viewModel?.getDataForCell(with: indexPath)
        cell.configure(with: data)
        
        return cell
    }
}
