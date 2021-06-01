//
//  LocalDataManager.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import UIKit
import CoreData

class LocalDataManager {
    
    static func getPosts() -> [PostModel] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Keys.postEntityName)
        do {
            let posts = try managedContext.fetch(fetchRequest).map({ managedObject -> PostModel in
                let userId = managedObject.value(forKey: Keys.userId) as? Int
                let id = managedObject.value(forKey: Keys.id) as? Int
                let title = managedObject.value(forKey: Keys.title) as? String
                let body = managedObject.value(forKey: Keys.body) as? String
                return PostModel(userId: userId, id: id, title: title, body: body)
            })
            return posts
        } catch let error as NSError {
            NSLog("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    static func getUser(by id: Int) -> UserModel? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Keys.userEntityName)
        do {
            let userManagedObject = try managedContext.fetch(fetchRequest).filter({ (managedObject) -> Bool in
                return managedObject.value(forKey: Keys.id) as? Int == id
            }).first
            if let userManagedObject = userManagedObject {
                
                let id = userManagedObject.value(forKey: Keys.id) as? Int
                let name = userManagedObject.value(forKey: Keys.name) as? String
                let username = userManagedObject.value(forKey: Keys.username) as? String
                let email = userManagedObject.value(forKey: Keys.email) as? String
                let phone = userManagedObject.value(forKey: Keys.phone) as? String
                let website = userManagedObject.value(forKey: Keys.website) as? String
                let company = userManagedObject.value(forKey: Keys.company) as? Company
                let address = userManagedObject.value(forKey: Keys.address) as? Address
                return UserModel(id: id, name: name, username: username, email: email, address: address, phone: phone, website: website, company: company)
            }
           return nil
        } catch let error as NSError {
            NSLog("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    static func savePosts(posts: [PostModel]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Keys.postEntityName, in: managedContext)!
        
        for post in posts {
            let newPost = NSManagedObject(entity: entity, insertInto: managedContext)
            newPost.setValue(post.id, forKey: Keys.id)
            newPost.setValue(post.userId, forKey: Keys.userId)
            newPost.setValue(post.title, forKey: Keys.title)
            newPost.setValue(post.body, forKey: Keys.body)
        }
        do {
            try managedContext.save()
        } catch {
            NSLog("Failed saving")
        }
    }
    
    static func saveUser(user: UserModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Keys.userEntityName, in: managedContext)!
        
        let newUser = NSManagedObject(entity: entity, insertInto: managedContext)
        newUser.setValue(user.id, forKey: Keys.id)
        newUser.setValue(user.name, forKey: Keys.name)
        newUser.setValue(user.username, forKey: Keys.username)
        newUser.setValue(user.email, forKey: Keys.email)
        newUser.setValue(user.address, forKey: Keys.address)
        newUser.setValue(user.phone, forKey: Keys.phone)
        newUser.setValue(user.website, forKey: Keys.website)
        newUser.setValue(user.company, forKey: Keys.company)
        do {
            try managedContext.save()
        } catch {
            NSLog("Failed saving")
        }
    }
    
    // this method is used for testing
    static func deleteAllData(_ entity:String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                managedContext.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
}

extension LocalDataManager {
    struct Keys {
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

