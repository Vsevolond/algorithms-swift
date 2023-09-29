//
//  main.swift
//  pyramid
//
//  Created by Всеволод on 17.05.2023.
//

import Foundation

let n = Int(readLine()!)!
var height = [Int: Int]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let w = input[0]
    let h = input[1]
    
    if height[w] == nil {
        height[w] = h
    } else {
        height[w] = max(height[w]!, h)
    }
}

var result = 0
for (_, value) in height {
    result += value
}

print(result)

