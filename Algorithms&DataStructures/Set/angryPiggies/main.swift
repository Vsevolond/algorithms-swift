//
//  main.swift
//  angryPiggies
//
//  Created by Всеволод on 21.03.2023.
//

import Foundation

let n = Int(readLine()!)!

var columns = [Int : Int]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let x = input[0], _ = input[1]
    
    if columns[x] != nil {
        columns[x]! += 1
    } else {
        columns[x] = 1
    }
}

var count = 0

print(columns.count)

