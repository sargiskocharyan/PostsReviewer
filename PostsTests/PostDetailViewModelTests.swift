//
//  PostDetailViewModelTests.swift
//  PostsTests
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import XCTest
@testable import TechnicalTask

class PostDetailViewModelTests: XCTestCase {

    var urlSession: URLSession!
    
    override class func setUp() {
        super.setUp()
    }
    
    override func setUpWithError() throws {
        // Set url session for mock networking
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }
    
    func testGetPosts() throws {
        // Profile API. Injected with custom url session for mocking
        let network = NetworkService(session: urlSession)
        
        // Set mock data
        let samplePostData = User(id: 1, name: "name test", username: "username test", email: "email test", address: Address(street: "street test", suite: "suite test", city: "city test", zipcode: "zipcode test"), phone: "phone test", website: "website test", company: Company(name: "company name test", catchPhrase: "catchPhrase test", bs: "bs test")) // PostModel(userId: 1, id: 1, title: "test post title", body: "test body")
        let samplDataArray = [samplePostData]
        let mockData = try JSONEncoder().encode(samplDataArray)
        
        // Return data in mock request handler
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        // Set expectation. Used to test async code.
        let expectation = XCTestExpectation(description: "response")
        
        // Make mock network request to get profile
        network.getUser(by: 1) { (data, error) in
            XCTAssertEqual(data?.name, "name test")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
