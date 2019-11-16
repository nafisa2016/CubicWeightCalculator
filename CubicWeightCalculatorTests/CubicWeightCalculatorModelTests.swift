//
//  ObjectModelTests.swift
//  CubicWeightCalculatorTests
//
//  Created by Nafisa Rahman on 11/16/19.
//  Copyright © 2019 com.nafisa. All rights reserved.
//

import XCTest
@testable import CubicWeightCalculator

class CubicWeightCalculatorModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testObjectModel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let str = """
            {
                "objects": [
                    {
                        "category": "Gadgets",
                        "title": "10 Pack Family Car Sticker Decals",
                        "weight": 120.0,
                        "size": {
                            "width": 15.0,
                            "length": 13.0,
                            "height": 1.0
                        }
                    },
                    {
                        "category": "Air Conditioners",
                        "title": "Window Seal for Portable Air Conditioner Outlets",
                        "weight": 235.0,
                        "size": {
                            "width": 26.0,
                            "length": 26.0,
                            "height": 5.0
                        }
                    },
                    {
                        "category": "Batteries",
                        "title": "10 Pack Kogan CR2032 3V Button Cell Battery",
                        "weight": 60.0,
                        "size": {
                            "width": 5.8,
                            "length": 19.0,
                            "height": 0.3
                        }
                    },
                    {
                        "category": "Cables & Adapters",
                        "title": "3 Pack Apple MFI Certified Lightning to USB Cable (3m)",
                        "weight": 90.0,
                        "size": {
                            "width": 10.0,
                            "length": 20.0,
                            "height": 3.0
                        }
                    },
                    {
                        "category": "Air Conditioners",
                        "title": "Kogan 10,000 BTU Portable Air Conditioner (2.9KW)",
                        "weight": 26200.0,
                        "size": {
                            "width": 49.6,
                            "length": 38.7,
                            "height": 89.0
                        }
                    }
                ],
                "next": "/api/products/2"
            }

        """
        
        let data = str.data(using: .utf8)
        let result = try? JSONDecoder().decode(ObjectModel.self, from: data!)
        
        if let result = result {
            XCTAssertEqual(result.next , "/api/products/2", "Next value is incorrect")
            XCTAssertEqual(result.objects[1].category, "Air Conditioners")
            
            if let size = result.objects[1].size {
                XCTAssertEqual(size.height, 5.0)
                XCTAssertEqual(size.width, 26.0)
                XCTAssertEqual(size.length, 26.0)
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
