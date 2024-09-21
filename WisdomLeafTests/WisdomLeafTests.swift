//
//  WisdomLeafTests.swift
//  WisdomLeafTests
//
//  Created by Venkata Hanumantharao Nagendla on 9/18/24.
//

import XCTest
@testable import WisdomLeaf

final class WisdomLeafTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testFetchMoviesSuccess() {
        let expectation = self.expectation(description: "Fetching movies should succeed")
        
        APIService.fetchMovies { result in
            switch result {
            case .success(let movies):
                XCTAssertFalse(movies.isEmpty, "Expected non-empty movie list")
            case .failure(let error):
                XCTFail("Expected success, but got error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    func testFetchMoviesInvalidURL() {
        let expectation = self.expectation(description: "Fetching movies should fail with invalid URL")
        
        // Create a subclass of APIService to override the URL for testing
        let invalidService = APIService() // Adjust as needed to set an invalid URL
        
        APIService.fetchMovies { result in
            switch result {
            case .success(_):
                XCTFail("Expected failure, but got success")
            case .failure(let error):
                XCTAssertNotNil(error, "Expected error for invalid URL")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    // Test handling of decoding errors
    func testFetchMoviesDecodingError() {
        let expectation = self.expectation(description: "Fetching movies should fail with decoding error")
        
        // Here you could potentially mock the network response to force a decoding error
        
        expectation.fulfill()
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
