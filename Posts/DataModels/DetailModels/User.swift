//
//  User.swift
//  Posts
//
//  Created by Sargis Kocharyan on 26.05.21.
//

import UIKit

class User: NSObject, NSCoding, Codable {

    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?

    init(id: Int?, name: String?, username: String?, email: String?, address: Address?, phone: String?, website: String?, company: Company?) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }

    enum Keys: String {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: Keys.id.rawValue)
        aCoder.encode(name, forKey: Keys.name.rawValue)
        aCoder.encode(username, forKey: Keys.username.rawValue)
        aCoder.encode(email, forKey: Keys.email.rawValue)
        aCoder.encode(address, forKey: Keys.address.rawValue)
        aCoder.encode(phone, forKey: Keys.phone.rawValue)
        aCoder.encode(website, forKey: Keys.website.rawValue)
        aCoder.encode(company, forKey: Keys.company.rawValue)
    }

    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: Keys.id.rawValue) as? Int
        name = aDecoder.decodeObject(forKey: Keys.name.rawValue) as? String
        username = aDecoder.decodeObject(forKey: Keys.username.rawValue) as? String
        email = aDecoder.decodeObject(forKey: Keys.email.rawValue) as? String
        address = aDecoder.decodeObject(forKey: Keys.address.rawValue) as? Address
        phone = aDecoder.decodeObject(forKey: Keys.phone.rawValue) as? String
        website = aDecoder.decodeObject(forKey: Keys.website.rawValue) as? String
        company = aDecoder.decodeObject(forKey: Keys.company.rawValue) as? Company
        super.init()
    }
}
