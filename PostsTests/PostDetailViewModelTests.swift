//
//  PostDetailViewModelTests.swift
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
        // url session for mock networking
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }
    
    func testGetPosts() throws {
        let network = NetworkService(session: urlSession)
        
        // Set mock data
        let samplePostData = UserModel(id: 1, name: "test name", username: "test username", email: "test email", address: Address(street: "test street", suite: "test suite", city: "test city", zipcode: "test zipcode"), phone: "test phone", website: "test website", company: Company(name: "company name test", catchPhrase: "catchPhrase test", bs: "bs test"))
        let samplDataArray = [samplePostData]
        let mockData = try JSONEncoder().encode(samplDataArray)
        
        // Return data in mock request handler
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        // Set expectation. Used to test async code.
        let expectation = XCTestExpectation(description: "response")
        
        network.getUser(by: 1) { (data, error) in
            XCTAssertEqual(data?.name, "test name")
            XCTAssertEqual(data?.email, "test email")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
