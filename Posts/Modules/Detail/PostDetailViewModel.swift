//
//  DetailViewModel.swift
//  Posts
//
//  Created by Sargis Kocharyan on 27.05.21.
//

import Foundation

class PostDetailViewModel {
    let networkService = NetworkService()
    
     func getUserFromRemote(_ id: Int, _ completion: @escaping (UserModel?, String?) -> ()) {
        networkService.getUser(by: id) { (user, error) in
            if let user = user {
                DispatchQueue.main.async {
                    LocalDataManager.saveUser(user: user)
                }
            }
            completion(user, error)
        }
    }
    
    func getUser(by id: Int, completion: @escaping (UserModel?, String?) -> ()) {
        let userFromLocalStorage = LocalDataManager.getUser(by: id)
        if userFromLocalStorage != nil {
            completion(userFromLocalStorage, nil)
        } else {
            getUserFromRemote(id, completion)
        }
    }
}
