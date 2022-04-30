//
//  BeerDetailsViewModel.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

enum DetailsSections: String, CaseIterable {
    case hops = "Hops"
    case malts = "Malts"
    case methods = "Methods"
}

protocol BeerDetailsViewModelProtocol {
    func getDataForCell(with indexPath: IndexPath) -> DetailCellData?
    
    var beer: Beer { get }
    var sections: [DetailsSections] { get }
}

final class BeerDetailsViewModel: BeerDetailsViewModelProtocol {
    let beer: Beer
    let sections: [DetailsSections]
    
    init(with beer: Beer) {
        self.beer = beer
        self.sections = DetailsSections.allCases
    }
    
    func getDataForCell(with indexPath: IndexPath) -> DetailCellData? {
        let section = sections[indexPath.section]
        switch section {
        case .hops:
            guard let item = beer.ingredients?.hops[indexPath.row] else { return nil }
            let value = item.amount.value
            let unit = item.amount.unit.rawValue
            
            return DetailCellData(name: item.name, value: "\(value) \(unit)")
        case .malts:
            guard let item = beer.ingredients?.malt[indexPath.row] else { return nil }
            let value = item.amount.value
            let unit = item.amount.unit.rawValue
            
            return DetailCellData(name: item.name, value: "\(value) \(unit)")
        case .methods:
            guard let item = beer.method else { return nil }
            let methodName: MethodName = item.availableMethods[indexPath.row]
            var value = 0
            var unit = ""
            switch methodName {
            case .mashTemp:
                value = item.mashTemp.first?.temp.value ?? 0
                unit = item.mashTemp.first?.temp.unit.rawValue ?? ""
            case .fermentation:
                value = item.fermentation.temp.value
                unit = item.fermentation.temp.unit.rawValue
            }
            
            return DetailCellData(name: methodName.rawValue, value: "\(value) \(unit)")
        }
    }
}
