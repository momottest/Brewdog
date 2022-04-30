//
//  Bindable.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    private var observer: ((T?) -> Void)?
    
    func bind(_ observer: @escaping (T?) -> Void) {
        self.observer = observer
    }
}
