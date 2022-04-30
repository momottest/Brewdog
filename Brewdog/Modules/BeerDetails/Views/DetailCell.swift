//
//  DetailCell.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

enum DetailCellType {
    case malt
    case hops
    case method
}

struct DetailCellData {
    let name: String
    let value: String
}

final class DetailCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    func configure(with data: DetailCellData?) {
        guard let data = data else { return }
        
        nameLabel.text = "\(data.name): "
        valueLabel.text = data.value
    }
}
