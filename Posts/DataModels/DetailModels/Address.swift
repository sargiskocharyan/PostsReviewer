//
//  Address.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import UIKit

// the Class is marked as public to dismiss Code Data warning
public class Address: NSObject, Codable, NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    
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
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(street, forKey: Keys.street.rawValue)
        aCoder.encode(suite, forKey: Keys.suite.rawValue)
        aCoder.encode(city, forKey: Keys.city.rawValue)
        aCoder.encode(zipcode, forKey: Keys.zipcode.rawValue)
    }

    public required init?(coder aDecoder: NSCoder) {
        street = aDecoder.decodeObject(forKey: Keys.street.rawValue) as? String
        suite = aDecoder.decodeObject(forKey: Keys.suite.rawValue) as? String
        city = aDecoder.decodeObject(forKey: Keys.city.rawValue) as? String
        zipcode = aDecoder.decodeObject(forKey: Keys.zipcode.rawValue) as? String
        super.init()
    }
}

@objc(CustomTransformer)
final class CustomTransformer: NSSecureUnarchiveFromDataTransformer {
    static let name = NSValueTransformerName(rawValue: String(describing: CustomTransformer.self))
    
    override class var allowedTopLevelClasses: [AnyClass] {
        return super.allowedTopLevelClasses + [Address.self] + [Company.self]
    }

    public class func register() {
        let transformer = CustomTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
