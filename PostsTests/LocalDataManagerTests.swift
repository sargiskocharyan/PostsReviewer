//
//  LocalDataManagerTests.swift
//  PostsTests
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import XCTest
@testable import TechnicalTask
import CoreData

var localDataManager: LocalDataManager!

class LocalDataManagerTests: XCTestCase {

    override class func setUp() {
        super.setUp()
        localDataManager = LocalDataManager()
    }

    func testDataSaveing()  {
//        localDataManager
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
