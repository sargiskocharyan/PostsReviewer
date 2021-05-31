//
//  LocalDataManager.swift
//  Posts
//
//  Created by Sargis Kocharyan on 26.05.21.
//

import UIKit
import CoreData

class LocalDataManager {
    
    static func getPosts() -> [PostModel] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.postEntityName)
        do {
            let posts = try managedContext.fetch(fetchRequest).map({ managedObject -> PostModel in
                let userId = managedObject.value(forKey: Constants.userId) as? Int
                let id = managedObject.value(forKey: Constants.id) as? Int
                let title = managedObject.value(forKey: Constants.title) as? String
                let body = managedObject.value(forKey: Constants.body) as? String
                return PostModel(userId: userId, id: id, title: title, body: body)
            })
            return posts
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    static func getUser(by id: Int) -> UserModel? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.userEntityName)
        do {
            let userManagedObject = try managedContext.fetch(fetchRequest).filter({ (managedObject) -> Bool in
                return managedObject.value(forKey: Constants.id) as? Int == id
            }).first
            if let userManagedObject = userManagedObject {
                let id = userManagedObject.value(forKey: Constants.id) as? Int
                let name = userManagedObject.value(forKey: Constants.name) as? String
                let username = userManagedObject.value(forKey: Constants.username) as? String
                let email = userManagedObject.value(forKey: Constants.email) as? String
                let phone = userManagedObject.value(forKey: Constants.phone) as? String
                let website = userManagedObject.value(forKey: Constants.website) as? String
                let company = userManagedObject.value(forKey: Constants.company) as? Company
                let address = userManagedObject.value(forKey: Constants.address) as? Address
                return UserModel(id: id, name: name, username: username, email: email, address: address, phone: phone, website: website, company: company)
            }
           return nil
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    static func savePosts(posts: [PostModel]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Constants.postEntityName, in: managedContext)!
        
        for post in posts {
            let newPost = NSManagedObject(entity: entity, insertInto: managedContext)
            newPost.setValue(post.id, forKey: Constants.id)
            newPost.setValue(post.userId, forKey: Constants.userId)
            newPost.setValue(post.title, forKey: Constants.title)
            newPost.setValue(post.body, forKey: Constants.body)
        }
        do {
            try managedContext.save()
        } catch {
            print("Failed saving")
        }
    }
    
    static func saveUser(user: UserModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Constants.userEntityName, in: managedContext)!
        
        let newUser = NSManagedObject(entity: entity, insertInto: managedContext)
        newUser.setValue(user.id, forKey: Constants.id)
        newUser.setValue(user.name, forKey: Constants.name)
        newUser.setValue(user.username, forKey: Constants.username)
        newUser.setValue(user.email, forKey: Constants.email)
        newUser.setValue(user.address, forKey: Constants.address)
        newUser.setValue(user.phone, forKey: Constants.phone)
        newUser.setValue(user.website, forKey: Constants.website)
        newUser.setValue(user.company, forKey: Constants.company)
        do {
            try managedContext.save()
        } catch {
            print("Failed saving")
        }
    }
}

extension LocalDataManager {
    struct Constants {
        static let name = "name"
        static let username = "username"
        static let email = "email"
        static let id = "id"
        static let address = "address"
        static let userId = "userId"
        static let phone = "phone"
        static let website = "website"
        static let title = "title"
        static let company = "company"
        static let body = "body"
        static let postEntityName = "Post"
        static let modelName = "Posts"
        static let userEntityName = "User"
    }
}

