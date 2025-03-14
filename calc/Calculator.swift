//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func calculate(args: [String]) -> String {
        
        var result = Int(args[0]) ?? 0
        var i = 1
        
        while i < args.count {
            let operatorSign = args[i];
            let nextValue = Int(args[i + 1]) ?? 0
            
            switch operatorSign {
                
                case "+":
                    result = add(no1: result, no2: nextValue)
                    
                case "-":
                    result = subtract(no1: result, no2: nextValue)
                    
                default:
                    return "Error Operato: \(operatorSign) unknown"
                
            }
            
            i += 2
        }
        
        return String(result);
    }
}
