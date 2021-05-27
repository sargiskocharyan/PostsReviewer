//
//  PostViewModel.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import Foundation

class PostViewModel {
    let networkManager = NetworkManager()
    var posts: [PostResponse] = []
    
    func getPosts(completion: @escaping (String?) -> ()) {
        let postsFromLocalStorage = LocalDataManager.getPosts()
        if postsFromLocalStorage.isEmpty {
            networkManager.getPosts { [self] (response, error)  in
                if let posts = response {
                    self.posts = posts
                    DispatchQueue.main.async {
                        LocalDataManager.savePosts(posts: posts)
                    }
                    completion(nil)
                    return
                }
                completion(error)
            }
        } else {
            self.posts = postsFromLocalStorage
            completion(nil)
        }
    }
    
}
