//
//  Beer.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

struct Beer: Decodable {
    let id: Int
    let name: String
    let description: String?
    let image: String?
    
    private enum CodingKeys : String, CodingKey {
        case id, name, description, image = "image_url"
    }
}
