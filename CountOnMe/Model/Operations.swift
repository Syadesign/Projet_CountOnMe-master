//
//  Operations.swift
//  CountOnMe
//
//  Created by samahir adi on 06/06/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

struct Operations {
   
    var elements :[String] = [String]()
    enum Operators {
        case add, substract, multiply, divide
    }
    
    var opSign: String? = ""
    var operatorSign: Operators = .add {
        didSet {
            setOperator(operatorSign)
        }
    }
    
    mutating func setOperator(_ sign: Operators) {
        switch sign {
        case.add:
            self.opSign = "+"
        case .substract:
            self.opSign = "-"
        case .multiply:
            self.opSign = "x"
        case .divide:
            self.opSign = "÷"
        }
        
    }
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != opSign
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != opSign
    }
    
    
    
    
}
