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
    
    var operatorSign = ""
   
    
    var expressionIsCorrect: Bool {
        return numbersArray.last != "+" && numbersArray.last != "-" && numbersArray.last != "/" && numbersArray.last != "x"
    }
    
    var expressionHaveEnoughElement: Bool {
        return numbersArray.count >= 3
    }
    
    var canAddOperator: Bool {
        return numbersArray.last != "+" && numbersArray.last != "-" && numbersArray.last != "/" && numbersArray.last != "x"
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
            operatorSign = "/"
        }
    }
    
    mutating func calculate() -> String {
        var operationsToReduce = numbersArray
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = left / right
            default: fatalError("Unknown operator !")
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        return " = \(operationsToReduce.first!)"
    }
}

