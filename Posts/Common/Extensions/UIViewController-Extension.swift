//
//  UIViewController-Extension.swift
//  Posts
//
//  Created by employee on 27.05.21.
//

import UIKit

extension UIViewController {
    func showErrorAlert(title: String, errorMessage: String) {
        let alert = UIAlertController(title: "Error message", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
