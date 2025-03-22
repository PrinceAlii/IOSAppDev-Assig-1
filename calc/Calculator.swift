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
        return no1 + no2
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2
    }
    
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2
    }
    
    func divide(no1: Int, no2: Int) -> Int? {
        return no2 == 0 ? nil : no1 / no2
    }
    
    func modulus(no1: Int, no2: Int) -> Int? {
        return no2 == 0 ? nil : no1 % no2
    }
    
    func calculate(args: [String]) -> String {
        var element = args
        
        var i = 0
        
        // division and multiplication
        while i < element.count {
            let op = element[i]
            
            if op == "x" || op == "/" || op == "%" {
                
                guard let left = Int(element[i - 1]),
                      let right = Int(element[i + 1])
                else {
                    return "| ERROR | Invalid input"
                }
                
                
                var result: Int?
                switch element[i] {
                    
                case "x":
                    result = multiply(no1: left, no2: right)
                    
                case "/":
                    result = divide(no1: left, no2: right)
                    
                case "%":
                    result = modulus(no1: left, no2: right)
                    
                default:
                    return "| ERROR | Unknown operato \(op)"
                }
                
                if result == nil {
                    return "| ERROR | Division by 0."
                }
                
                element[i - 1] = String(result!)
                element.remove(at: i)
                element.remove(at: i)
                i -= 1
            }
            
            i += 1
        }
        
        // addition and subtraction
        var result = Int(element[0]) ?? 0
        i = 1
        while i < element.count {
            let op = element[i]
            let nextValue = Int(element[i + 1]) ?? 0
            
            switch op {
            case "+":
                result = add(no1: result, no2: nextValue)
                
            case "-":
                result = subtract(no1: result, no2: nextValue)
                
            default: 
                return "| ERROR | Unknown operato \(op)"
                
            }
            
            i += 2
        }
        
        return String(result)
    }
}
