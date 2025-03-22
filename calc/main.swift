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

// Initialize a calculator object
let calculator = Calculator()

let result = calculator.calculate(args: args)

// if the output is an error, print it to standard error and exit with a non zero exit code (for tests)
if result.starts(with: "| ERROR |") {
    fputs(result + "\n", stderr)
    exit(1)
}

print(result)
