//
//  ResponseModels.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import Foundation

struct PostModel: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}

