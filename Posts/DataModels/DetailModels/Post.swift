//
//  Post.swift
//  TechnicalTask
//
//  Created by Sargis Kocharyan on 6/1/21.
//

import Foundation

class Post: NSObject, NSCoding, Codable {

    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?

    enum Keys: String {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }

    init(userId: Int, id: Int, title: String, body: String) {
      
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(userId, forKey: Keys.userId.rawValue)
        aCoder.encode(id, forKey: Keys.id.rawValue)
        aCoder.encode(title, forKey: Keys.title.rawValue)
        aCoder.encode(body, forKey: Keys.body.rawValue)
    }

    required init?(coder aDecoder: NSCoder) {
        userId = aDecoder.decodeObject(forKey: Keys.userId.rawValue) as? Int
        id = aDecoder.decodeObject(forKey: Keys.id.rawValue) as? Int
        title = aDecoder.decodeObject(forKey: Keys.title.rawValue) as? String
        body = aDecoder.decodeObject(forKey: Keys.body.rawValue) as? String
        super.init()
    }
}
