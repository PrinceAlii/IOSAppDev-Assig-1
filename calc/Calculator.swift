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
    
    func validateIntegers(_ str: String) -> Bool {
        // check if input contains valid numbers
        let validIntegers = CharacterSet(charactersIn: "0123456789-")
        if str.rangeOfCharacter(from: validIntegers.inverted) != nil {
            return false
        }
        
        // check if the input is within the max range for the Int type
        if let num = Int(str) {
            return num <= Int.max && num >= Int.min
        }
        
        return false // number is not valid if it can't convert
    }
    
    func calculate(args: [String]) -> String {
        var element = args
        
        // check that every element that isn't an operator can be parsed as an int. if not throw an error
        for arg in element {
            if !["+", "-", "x", "/", "%"].contains(arg) {
                if Int(arg) == nil {
                    return "| ERROR | Invalid input: \(arg)"
                }
            }
        }
        
        var i = 0
        
        // division and multiplication
        while i < element.count {
            let op = element[i]
            
            if op == "x" || op == "/" || op == "%" {
                
                // check that there is a valid integer on the left and right of every operator
                guard i - 1 >= 0, i + 1 < element.count,
                      let left = Int(element[i - 1]),
                      let right = Int(element[i + 1])
                else {
                    return "| ERROR | Invalid input"
                }
                
                var currentResult: Int?
                switch element[i] {
                    
                case "x":
                    currentResult = multiply(no1: left, no2: right)
                    
                case "/":
                    currentResult = divide(no1: left, no2: right)
                    
                case "%":
                    currentResult = modulus(no1: left, no2: right)
                    
                default:
                    return "| ERROR | Unknown operator \(op)"
                }
                
                if currentResult == nil {
                    return "| ERROR | Division by 0."
                }
                
                element[i - 1] = String(currentResult!)
                element.remove(at: i)
                element.remove(at: i)
                i -= 1
            }
            
            i += 1
        }
        
        // addition and subtraction
        var currentResult = Int(element[0]) ?? 0
        i = 1
        while i < element.count {
            let op = element[i]
            let nextValue = Int(element[i + 1]) ?? 0
            
            switch op {
            case "+":
                currentResult = add(no1: currentResult, no2: nextValue)
                
            case "-":
                currentResult = subtract(no1: currentResult, no2: nextValue)
                
            default:
                return "| ERROR | Unknown operato \(op)"
                
            }
            
            i += 2
        }
        
        return String(currentResult)
    }
}
