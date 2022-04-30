//
//  Method.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

enum MethodName: String, CaseIterable {
    case mashTemp = "Mash Temperature"
    case fermentation = "Fermentation"
}

struct Method: Decodable {
    let mashTemp: [TempResponse]
    let fermentation: TempResponse
    
    private enum CodingKeys : String, CodingKey {
        case mashTemp = "mash_temp", fermentation
    }
    
    let availableMethods: [MethodName] = MethodName.allCases
}

struct TempResponse: Decodable {
    let temp: Temp
}

struct Temp: Decodable {
    let value: Int
    let unit: TempUnit
}

enum TempUnit: String, Decodable {
    case celsius
}
