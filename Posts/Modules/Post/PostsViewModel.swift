//
//  PostViewModel.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import Foundation

class PostsViewModel {
    let networkService = NetworkService()
    var posts: [PostModel] = []
    
    func getPosts(completion: @escaping (String?) -> ()) {
        let postsFromLocalStorage = LocalDataManager.getPosts()
        if postsFromLocalStorage.isEmpty {
            networkService.getPosts { [self] (response, error)  in
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
