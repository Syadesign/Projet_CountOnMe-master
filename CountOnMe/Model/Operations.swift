//
//  Operations.swift
//  CountOnMe
//
//  Created by samahir adi on 06/06/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

struct Operations {

    // Save the numbers and the operators
    var numbersText = ""

    // Make an array with the numbersText
    var nbrsArray: [String] {
        return numbersText.split(separator: " ").map { "\($0)"
        }
    }

    var operatorSign = ""

    // Check if the last element in numbersArray is not an operator
    var expressionIsCorrect: Bool {
        return nbrsArray.last != "+" && nbrsArray.last != "-" && nbrsArray.last != "/" && nbrsArray.last != "x"
    }

    // Check if numbersArray contains at least 3 elements
    var expressionHaveEnoughElement: Bool {
        return nbrsArray.count >= 3
    }

    // Check if the last element in numbersArray is not an operator
    var canAddOperator: Bool {
        return nbrsArray.last != "+" && nbrsArray.last != "-" && nbrsArray.last != "/" && nbrsArray.last != "x"
    }

    //Check if numbersText contains "="
    var expressionHaveResult: Bool {
        return numbersText.firstIndex(of: "=") != nil
    }

    // Observe which operator is it
    var currentOperator: Operators = .add {
        didSet {
            setOperator(currentOperator)
        }
    }

    // 4 possible operators
    enum Operators {
        case add, substract, multiply, divide
    }

    /// Change sign displayed with each operator
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

    /// Calculate according to each operator
    mutating func calculate() -> String {
        var operationsToReduce = nbrsArray
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
