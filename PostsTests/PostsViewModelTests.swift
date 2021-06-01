//
//  PostsViewModelTests.swift
//  PostsTests
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import XCTest
@testable import TechnicalTask

class PostsViewModelTests: XCTestCase {
    
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
        let samplePostData = Post(userId: 1, id: 1, title: "test post title", body: "test body")
        let samplDataArray = [samplePostData]
        let mockData = try JSONEncoder().encode(samplDataArray)
        
        // Return data in mock request handler
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        // Set expectation. Used to test async code.
        let expectation = XCTestExpectation(description: "response")
        
        // Make mock network request to get profile
        network.getPosts { data, error in
            // Test
            XCTAssertEqual(data?.first?.title, "test post title")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
}
