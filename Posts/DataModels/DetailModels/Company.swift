//
//  Company.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import UIKit
// the class is marked as public to dismiss Code Data warning
public class Company: NSObject, Codable, NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    
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

   public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Keys.name.rawValue)
        aCoder.encode(catchPhrase, forKey: Keys.catchPhrase.rawValue)
        aCoder.encode(bs, forKey: Keys.bs.rawValue)
    }

    public required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: Keys.name.rawValue) as? String
        catchPhrase = aDecoder.decodeObject(forKey: Keys.catchPhrase.rawValue) as? String
        bs = aDecoder.decodeObject(forKey: Keys.bs.rawValue) as? String
        super.init()
    }
}
