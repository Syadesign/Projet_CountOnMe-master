//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest

@testable import CountOnMe

class SimpleCalcTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_Given() {
    
        let operation = Operations()
        var numbersArray = operation.numbersArray
        numbersArray[2] = "+"
        XCTAssertFalse(operation.expressionIsCorrect)
        
        }
}
