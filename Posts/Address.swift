//
//  Address.swift
//  Posts
//
//  Created by employee on 26.05.21.
//

import UIKit

class Address: NSObject, NSCoding, Codable {

    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?

    enum Keys: String {
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
    }

    init(street: String?, suite: String?, city: String?, zipcode: String?) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(street, forKey: "street")
        aCoder.encode(suite, forKey: "suite")
        aCoder.encode(city, forKey: "city")
        aCoder.encode(zipcode, forKey: "zipcode")
    }

    required init?(coder aDecoder: NSCoder) {
        street = aDecoder.decodeObject(forKey: "street") as? String
        suite = aDecoder.decodeObject(forKey: "suite") as? String
        city = aDecoder.decodeObject(forKey: "city") as? String
        zipcode = aDecoder.decodeObject(forKey: "zipcode") as? String
        super.init()
    }
}
