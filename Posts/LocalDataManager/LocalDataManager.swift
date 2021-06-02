//
//  LocalDataManager.swift
//  Posts
//
//  Created by Sargis Kocharyan on 26.05.21.
//

import UIKit
import CoreData

class LocalDataManager {
    
    static func getPosts() -> [Post] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Keys.postEntityName)
        do {
            let posts = try managedContext.fetch(fetchRequest).compactMap({ managedObject -> Post? in
                let post = managedObject.value(forKey: Keys.post) as? Post
                return post
            })
            return posts
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    static func savePosts(posts: [Post]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Keys.postEntityName, in: managedContext)!
        
        for post in posts {
            let newPost = NSManagedObject(entity: entity, insertInto: managedContext)
            newPost.setValue(post, forKey: Keys.post)
        }
        do {
            try managedContext.save()
        } catch {
            print("Failed saving")
        }
    }
    
    
    static func saveUser(user: User) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Keys.userEntityName, in: managedContext)!
        
        let newUser = NSManagedObject(entity: entity, insertInto: managedContext)
        newUser.setValue(user, forKey: Keys.user)
        do {
            try managedContext.save()
        } catch {
            print("Failed saving")
        }
    }
    
    static func getUser(by id: Int) -> User? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Keys.userEntityName)
        do {
            let user = try managedContext.fetch(fetchRequest).compactMap({ (managedObject) -> User? in
                if (managedObject.value(forKey: Keys.user) as? User)?.id == id {
                    return managedObject.value(forKey: Keys.user) as? User
                }
                return nil
            }).first
           return user
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
}

extension LocalDataManager {
    struct Keys {
        static let postEntityName = "Posts"
        static let modelName = "Posts"
        static let userEntityName = "Users"
        static let post = "post"
        static let user = "user"
    }
}

