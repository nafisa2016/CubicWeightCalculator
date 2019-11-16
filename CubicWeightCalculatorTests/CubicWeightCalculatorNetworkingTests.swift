//
//  ObjectNetworkingTests.swift
//  CubicWeightCalculatorTests
//
//  Created by Nafisa Rahman on 11/16/19.
//  Copyright © 2019 com.nafisa. All rights reserved.
//

import XCTest

class CubicWeightCalculatorNetworkingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworking() {
        let baseURL = "http://wp8m3he1wt.s3-website-ap-southeast-2.amazonaws.com"
        let pageURL = "/api/products/1"
        let endPoint = baseURL + pageURL
        
        let url = URL(string: endPoint)!
        let urlExpectation = expectation(description: "GET \(url)")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            XCTAssertNotNil(data, "Data should not be nil")
            XCTAssertNil(error, "Error should be nil")
            
            if let response = response as? HTTPURLResponse,
                let responseURL = response.url {
                XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(response.statusCode, 200, "HTTP response status code should be 200")
                
            } else {
                XCTFail("Response was not HTTPURLResponse")
            }
            
            urlExpectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
