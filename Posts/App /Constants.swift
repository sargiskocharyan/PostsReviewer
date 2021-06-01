//
//  Constants.swift
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import UIKit

struct Environment {
    static let baseURL = "http://jsonplaceholder.typicode.com/"
}

extension UIColor {
    static var appLightGray: UIColor {
        return UIColor(named: "appLightGray") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static var appBlue: UIColor {
        return UIColor(named: "appBlue") ?? #colorLiteral(red: 0, green: 0.5965470672, blue: 1, alpha: 1)
    }
}
