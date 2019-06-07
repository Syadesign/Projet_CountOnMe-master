//
//  Operations.swift
//  CountOnMe
//
//  Created by samahir adi on 06/06/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

struct Operations {
    
    var numbersText = ""
   
    var numbersArray :[String] {
        return numbersText.split(separator: " ").map { "\($0)"
    }
    }
    var total = 0
    var operatorSign = ""
    var test = ""
    
    var expressionIsCorrect: Bool {
        return numbersArray.last != "+" && numbersArray.last != "-" && numbersArray.last != "÷" && numbersArray.last != "x"
    }
    
    var expressionHaveEnoughElement: Bool {
        return numbersArray.count >= 3
    }
    
    var canAddOperator: Bool {
        return numbersArray.last != "+" && numbersArray.last != "-" && numbersArray.last != "÷" && numbersArray.last != "x"
    }
    
    var expressionHaveResult: Bool {
        return numbersText.firstIndex(of: "=") != nil
    }
    
    var currentOperator: Operators = .add {
        didSet {
            setOperator(currentOperator)
        }
    }
    
    enum Operators {
        case add, substract, multiply, divide
    }
    
   mutating func setOperator(_ currentOperator: Operators) {
        switch currentOperator {
        case .add:
            operatorSign = "+"
        case .substract:
            operatorSign = "-"
        case .multiply:
            operatorSign = "x"
        case .divide:
            operatorSign = "÷"
        }
    }
    
    mutating func operate() -> Int {
        if numbersArray.count >= 2 {
        switch currentOperator {
        case .add:
            total = Int(numbersArray[0] + numbersArray[1])!
        case .substract:
            total = Int(numbersArray[0])! - Int(numbersArray[1])!
        case .multiply:
            total = Int(numbersArray[0])! * Int(numbersArray[1])!
        case .divide:
            total = Int(numbersArray[0])! / Int(numbersArray[1])!
        }
    }
        return total
    }
}

