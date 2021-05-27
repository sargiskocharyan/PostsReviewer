//
//  RequestCreator.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import Foundation

class NetworkManager {
    
    func getPosts(completion: @escaping ([PostResponse]?, String?) -> ()) {
        let url = URL(string: Endpoints.posts)!
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethods.get.rawValue
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let posts = try? JSONDecoder().decode([PostResponse].self, from: data) {
                    completion(posts, nil)
                } else {
                    completion(nil, "Invalid Response")
                }
            } else if let error = error {
                completion(nil, error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getUser(by id: Int, completion: @escaping (UserModel?, String?) -> ()) {
        let url = URL(string: Endpoints.users + "?id=\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethods.get.rawValue
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let user = try? JSONDecoder().decode([UserModel].self, from: data).first {
                    completion(user, nil)
                } else {
                    completion(nil, "Invalid Response")
                }
            } else if let error = error {
                completion(nil, error.localizedDescription)
            }
        }
        task.resume()
    }
}
