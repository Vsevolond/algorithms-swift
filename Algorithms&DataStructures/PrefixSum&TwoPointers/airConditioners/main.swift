//
//  main.swift
//  airConditioners
//
//  Created by Всеволод on 23.05.2023.
//

import Foundation

let n = Int(readLine()!)!
var classes = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

var conditioners = [(power: Int, cost: Int)]()
for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    conditioners.append((input[0], input[1]))
}

classes.sort()
conditioners.sort(by: { $0.cost < $1.cost })

var i = 0
var sum = 0
for x in classes {
    if conditioners[i].power >= x {
        sum += conditioners[i].cost
    } else {
        while i != m && conditioners[i].power < x {
            i += 1
        }
        
        sum += conditioners[i].cost
    }
}

print(sum)

