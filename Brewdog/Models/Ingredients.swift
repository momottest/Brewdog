//
//  Ingredients.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

struct Ingredients: Decodable {
    let malt: [Malt]
    let hops: [Hop]
}

struct Malt: Decodable {
    let name: String
    let amount: Amount
}

struct Hop: Decodable {
    let name: String
    let amount: Amount
}

struct Amount: Decodable {
    let value: Double
    let unit: WeigthUnit
}

enum WeigthUnit: String, Decodable {
    case kilograms
    case grams
}
