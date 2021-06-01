//
//  LocalDataManagerTests.swift
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import XCTest
import CoreData

@testable import TechnicalTask

class LocalDataManagerTests: XCTestCase {
    
    var localDataManager: LocalDataManager!

    override class func setUp() {
        super.setUp()
    }

    func testSavePosts() {
        LocalDataManager.deleteAllData("Post")
        let post = PostModel(userId: 1, id: 1, title: "first", body: "first body")
        LocalDataManager.savePosts(posts: [post])
        let allPosts = LocalDataManager.getPosts()
        XCTAssertEqual(allPosts[0].title, "first")
    }
    
    func testSaveUser() {
        LocalDataManager.deleteAllData("User")
        let user = UserModel(id: 1, name: "Piter", username: "user1", email: "dummyMail@mail.com", address: nil, phone: "+004917500332", website: nil, company: nil)
        LocalDataManager.saveUser(user: user)
        let userFromDB = LocalDataManager.getUser(by: 1)
        XCTAssertEqual(userFromDB?.username, "user1")
    }
    
    func testGetPosts() {
        LocalDataManager.deleteAllData("Post")
        let post1 = PostModel(userId: 1, id: 1, title: "first", body: "first body")
        let post2 = PostModel(userId: 1, id: 2, title: "second post", body: "sec body")
        LocalDataManager.savePosts(posts: [post1, post2])
        let allPosts = LocalDataManager.getPosts()
        XCTAssertEqual(allPosts.count, 2)
        XCTAssertEqual(allPosts[1].title, "second post")
    }
    
    func testGetUser() {
        LocalDataManager.deleteAllData("User")
        let user1 = UserModel(id: 1, name: "Piter", username: "user1", email: "dummyMail@mail.com", address: nil, phone: "+004917500332", website: nil, company: nil)
        let user2 = UserModel(id: 2, name: "Tom", username: "user22", email: "example@mail.com", address: nil, phone: "+00491123456", website: nil, company: nil)
        LocalDataManager.saveUser(user: user1)
        LocalDataManager.saveUser(user: user2)
        let userFromDB = LocalDataManager.getUser(by: 2)
        XCTAssertEqual(userFromDB?.username, "user22")
    }

}
