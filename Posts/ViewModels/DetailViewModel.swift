//
//  DetailViewModel.swift
//  Posts
//
//  Created by employee on 27.05.21.
//

import Foundation

class DetailViewModel {
    let networkManager = NetworkManager()
    
    func getUser(by id: Int, completion: @escaping (UserModel?, String?) -> ()) {
        let userFromLocalStorage = LocalDataManager.getUser(by: id)
        if userFromLocalStorage != nil {
            completion(userFromLocalStorage, nil)
            return
        }
        networkManager.getUser(by: id) { (user, error) in
            if let user = user {
                DispatchQueue.main.async {
                    LocalDataManager.saveUser(user: user)
                }
            }
            completion(user, error)
        }
    }
}
