//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Retrieve User Input
//let no1 = args[0]; // Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
//let no2 = args[2]; // Sample Code Only! Update Required!

// Initialize a Calculator object
let calculator = Calculator();

// take in the args from the command line and the split each element into an array
if let input = readLine() {
    
    let arguments = input.split(separator: " ").map { String($0) }
    
    let result = calculator.calculate(args: arguments);
    
    print(result);
}
