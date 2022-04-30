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
        configureTableView()
        viewModel?.search()
    }
    
    private func binding() {
        viewModel?.beers.bind {[weak self] beers in
            DispatchQueue.main.async {
                self?.listTableView.reloadData()
            }
        }
        
        viewModel?.error.bind {[weak self] error  in
            DispatchQueue.main.async {
                self?.showAlert(withTitle: "Error", message: error?.localizedDescription, closeHandler: nil)
            }
        }
    }
    
    private func configureTableView() {
        let reuseId = String(describing: BeerCell.self)
        let cellNib = UINib(nibName: reuseId, bundle: Bundle(for: BeerCell.self))
        listTableView.register(cellNib, forCellReuseIdentifier: reuseId)
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.separatorStyle = .singleLine
    }
    
}

// MARK: - UITableViewDelegate
extension BeerListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let count = viewModel?.beers.value?.count, count > indexPath.row else { return }
        guard let beer = viewModel?.beers.value?[indexPath.row] else { return }
        
        onShowDetails?(beer)
    }
}

// MARK: - UITableViewDataSource
extension BeerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.beers.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseId = String(describing: BeerCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? BeerCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel?.beers.value?[indexPath.row])
        
        return cell
    }
}

