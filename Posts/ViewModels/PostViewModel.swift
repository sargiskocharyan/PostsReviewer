//
//  PostViewModel.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import Foundation

class PostViewModel {
    let network = NetworkManager()
    var posts: [PostResponse] = []
    
    func getPosts(completion: @escaping (Bool) -> ()) {
        network.getPosts { [self] (response) in
            if response != nil {
                posts = response!
                completion(true)
            }
            completion(false)
        }
    }
    
}
