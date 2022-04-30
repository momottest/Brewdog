//
//  BeerCell.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

final class BeerCell: UITableViewCell {
    
    @IBOutlet private weak var beerImageView: LoadableImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var abvLabel: UILabel!
    
    func configure(with beer: Beer?) {
        nameLabel.text = beer?.name
        
        abvLabel.text = ""
        if let abv = beer?.abv {
            abvLabel.text = "ABV: \(abv) %"
        }
        
        if let imageUrl = beer?.image {
            beerImageView.loadImageWithUrl(urlString: imageUrl)
        }
    }
}
