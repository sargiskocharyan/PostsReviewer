//
//  Constants.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import Foundation

struct Environment {
    static let baseURL = "http://jsonplaceholder.typicode.com/"
}

struct Endpoints {
    static let posts = Environment.baseURL + "posts"
    static let users = Environment.baseURL + "users"
}

enum RequestMethods: String {
    case get = "GET"
    case post = "POST"
}

