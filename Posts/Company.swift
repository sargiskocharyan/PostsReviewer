//
//  Company.swift
//  Posts
//
//  Created by employee on 26.05.21.
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
        aCoder.encode(name, forKey: "name")
        aCoder.encode(catchPhrase, forKey: "catchPhrase")
        aCoder.encode(bs, forKey: "bs")
    }

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String
        catchPhrase = aDecoder.decodeObject(forKey: "catchPhrase") as? String
        bs = aDecoder.decodeObject(forKey: "bs") as? String
        super.init()
    }
}
