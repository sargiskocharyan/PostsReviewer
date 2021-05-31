//
//  Company.swift
//  Posts
//
//  Created by Sargis Kocharyan on 26.05.21.
//

import UIKit

class Company: NSObject, NSCoding, Codable {

    var name: String?
    var catchPhrase: String?
    var bs: String?

    enum Keys: String {
        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }

    init(name: String?, catchPhrase: String?, bs: String?) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Keys.name.rawValue)
        aCoder.encode(catchPhrase, forKey: Keys.catchPhrase.rawValue)
        aCoder.encode(bs, forKey: Keys.bs.rawValue)
    }

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: Keys.name.rawValue) as? String
        catchPhrase = aDecoder.decodeObject(forKey: Keys.catchPhrase.rawValue) as? String
        bs = aDecoder.decodeObject(forKey: Keys.bs.rawValue) as? String
        super.init()
    }
}
