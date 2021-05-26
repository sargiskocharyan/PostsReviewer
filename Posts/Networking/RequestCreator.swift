//
//  RequestCreator.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import Foundation

class NetworkManager {
    
    func getPosts(completion: @escaping ([PostResponse]?) -> ()) {
        let url = URL(string: "http://jsonplaceholder.typicode.com/posts")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let posts = try? JSONDecoder().decode([PostResponse].self, from: data) {
                    print(posts)
                    completion(posts)
                } else {
                    print("Invalid Response")
                    completion(nil)
                }
            } else if let error = error {
                completion(nil)
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
}
