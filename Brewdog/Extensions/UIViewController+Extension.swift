//
//  UIViewController+Extension.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

extension UIViewController {
        
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: Bundle.main)
        }
        
        return instantiateFromNib()
    }
}
