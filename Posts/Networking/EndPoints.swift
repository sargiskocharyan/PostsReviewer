//
//  EndPoints.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import Foundation

struct Endpoints {
    static let posts = Environment.baseURL + "posts"
    static let users = Environment.baseURL + "users"
}

enum RequestMethods: String {
    case get = "GET"
    case post = "POST"
}

