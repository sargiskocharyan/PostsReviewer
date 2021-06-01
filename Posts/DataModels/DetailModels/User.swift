//
//  User.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import UIKit

struct UserModel: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
}
