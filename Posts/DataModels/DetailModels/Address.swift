//
//  Address.swift
//  Posts
//
//  Created by Sargis Kocharyan on 26.05.21.
//

import UIKit

class Address: NSObject, NSCoding, Codable {

    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?

    init(street: String?, suite: String?, city: String?, zipcode: String?) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
    }

    enum Keys: String {
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(street, forKey: Keys.street.rawValue)
        aCoder.encode(suite, forKey: Keys.suite.rawValue)
        aCoder.encode(city, forKey: Keys.city.rawValue)
        aCoder.encode(zipcode, forKey: Keys.zipcode.rawValue)
    }

    required init?(coder aDecoder: NSCoder) {
        street = aDecoder.decodeObject(forKey: Keys.street.rawValue) as? String
        suite = aDecoder.decodeObject(forKey: Keys.suite.rawValue) as? String
        city = aDecoder.decodeObject(forKey: Keys.city.rawValue) as? String
        zipcode = aDecoder.decodeObject(forKey: Keys.zipcode.rawValue) as? String
        super.init()
    }
}


