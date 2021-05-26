//
//  PostViewModel.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import Foundation

class PostViewModel {
    let network = NetworkManager()
    
    func getPosts(completion: @escaping ([PostResponse]?) -> ()) {
        network.getPosts { (response) in
            completion(response)
        }
    }
}
