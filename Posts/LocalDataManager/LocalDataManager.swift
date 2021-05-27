//
//  LocalDataManager.swift
//  Posts
//
//  Created by employee on 26.05.21.
//

import UIKit
import CoreData

class LocalDataManager {
    
    static func getPosts() -> [PostResponse] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.postEntityName)
        do {
            let posts = try managedContext.fetch(fetchRequest).map({ managedObject -> PostResponse in
                let userId = managedObject.value(forKey: "userId") as? Int
                let id = managedObject.value(forKey: Constants.id) as? Int
                let title = managedObject.value(forKey: Constants.title) as? String
                let body = managedObject.value(forKey: Constants.body) as? String
                return PostResponse(userId: userId, id: id, title: title, body: body)
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
                return managedObject.value(forKey: "id") as? Int == id
            }).first
            if let userManagedObject = userManagedObject {
                let id = userManagedObject.value(forKey: "id") as? Int
                let name = userManagedObject.value(forKey: "name") as? String
                let username = userManagedObject.value(forKey: "username") as? String
                let email = userManagedObject.value(forKey: "email") as? String
                let phone = userManagedObject.value(forKey: "phone") as? String
                let website = userManagedObject.value(forKey: "website") as? String
                let company = userManagedObject.value(forKey: "company") as? Company
                let address = userManagedObject.value(forKey: "address") as? Address
                return UserModel(id: id, name: name, username: username, email: email, address: address, phone: phone, website: website, company: company)
            }
           return nil
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    static func savePosts(posts: [PostResponse]) {
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
        newUser.setValue(user.id, forKey: "id")
        newUser.setValue(user.name, forKey: "name")
        newUser.setValue(user.username, forKey: "username")
        newUser.setValue(user.email, forKey: "email")
        newUser.setValue(user.address, forKey: "address")
        newUser.setValue(user.phone, forKey: "phone")
        newUser.setValue(user.website, forKey: "website")
        newUser.setValue(user.company, forKey: "company")
        do {
            try managedContext.save()
        } catch {
            print("Failed saving")
        }
    }
}

extension LocalDataManager {
    struct Constants {
        static let id = "id"
        static let userId = "userId"
        static let title = "title"
        static let body = "body"
        static let postEntityName = "Post"
        static let modelName = "Posts"
        static let userEntityName = "User"
    }
}

