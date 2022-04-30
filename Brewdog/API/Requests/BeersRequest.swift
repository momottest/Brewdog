//
//  BeersRequest.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

struct BeersRequest: APIRequest {
    typealias Response = [Beer]
    
    var path: String {
        return "beers"
    }
}
