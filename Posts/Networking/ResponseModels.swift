//
//  ResponseModels.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import Foundation

struct PostResponse: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
