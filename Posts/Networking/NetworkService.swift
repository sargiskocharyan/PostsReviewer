//
//  RequestCreator.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/26/21.
//

import Foundation

class NetworkService {
    
    //session to be used to make the API call.
    let session: URLSession
    
    //In unit tests, a mock session can be injected.
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getPosts(completion: @escaping ([PostModel]?, String?) -> ()) {
        let url = URL(string: Endpoints.posts)!
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethods.get.rawValue
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let posts = try? JSONDecoder().decode([PostModel].self, from: data) {
                    completion(posts, nil)
                } else {
                    completion(nil, "inavlid_response")
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
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let user = try? JSONDecoder().decode([UserModel].self, from: data).first {
                    completion(user, nil)
                } else {
                    completion(nil, "inavlid_response")
                }
            } else if let error = error {
                completion(nil, error.localizedDescription)
            }
        }
        task.resume()
    }
}
