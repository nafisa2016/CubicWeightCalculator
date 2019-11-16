//
//  ViewControllerTests.swift
//  CubicWeightCalculatorTests
//
//  Created by Nafisa Rahman on 11/16/19.
//  Copyright © 2019 com.nafisa. All rights reserved.
//

import XCTest
@testable import CubicWeightCalculator

class CubicWeightCalculatorViewTests: XCTestCase {
    var viewController: ViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "first") as? ViewController
        viewController.loadView()
        viewController.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLabelExists() {
        XCTAssertNotNil(viewController.avgCubicWeightValLbl)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
