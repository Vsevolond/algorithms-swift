//
//  main.swift
//  turtles
//
//  Created by Всеволод on 21.03.2023.
//

import Foundation

let n = Int(readLine()!)!

var turtleComments = Set<Int>()

var count = 0

for _ in 1...n {
    let str = readLine()!.split(separator: " ").map { Int($0)! }
    
    let a = str[0], b = str[1]
    
    if a >= 0 && b >= 0 &&
        a + b == n - 1 {
        turtleComments.insert(a)
    }
}


print(turtleComments.count)

