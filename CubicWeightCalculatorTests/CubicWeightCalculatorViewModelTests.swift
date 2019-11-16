//
//  CubicWeightCalculatorTests.swift
//  CubicWeightCalculatorTests
//
//  Created by Nafisa Rahman on 11/16/19.
//  Copyright © 2019 com.nafisa. All rights reserved.
//

import XCTest
@testable import CubicWeightCalculator

class CubicWeightCalculatorViewModelTests: XCTestCase {
    var objectViewModel: ObjectViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        objectViewModel = ObjectViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testCubicWeight() {
        let cubicWeight = objectViewModel.getCubicWeight(width: 30.0, height: 40.0, length: 50.0)
        XCTAssertTrue(cubicWeight == 15.0, "Cubic Weight is not correct")
    }
    
    func testUpdateSum() {
        objectViewModel.sum = 100.0
        let sum = objectViewModel.updateSum(cubicWeight: 50.0)
        XCTAssertTrue(sum == 150.0, "Sum is incorrect")
    }
    
    func testgetAverage() {
        let avg = objectViewModel.getAverage(sum: 100.0, count: 10)
        XCTAssertTrue(avg == 10, "Average is incorrect")
    }
    
    func testAvgFormat() {
        let formattedWeight = objectViewModel.formatAvgCubicWeight(weight: 32.986456799)
        XCTAssertTrue(formattedWeight == "32.9865", "Formatted weight is incorrect")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
