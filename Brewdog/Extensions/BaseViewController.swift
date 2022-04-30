//
//  BaseViewController.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var activity: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activity.fill(in: view)
    }
    
    func showAlert(
        withTitle title: String?,
        message: String?,
        closeHandler: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .cancel) { _ in
            closeHandler?()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

