//
//  main.swift
//  triangleOfMax
//
//  Created by Всеволод on 27.02.2023.
//

import Foundation

let n = Int(readLine()!)!
var past = Double(readLine()!)!

var left, right: Double?

for _ in 1...n-1 {
    let str = readLine()!.split(separator: " ")
    let new = Double(str[0])!, type = str[1]
    
    if abs(new - past) < (1 / 1000000) {
        continue
    }
    
    switch type {
    case "closer":
        if new < past {
            if right == nil {
                right = (new + past) / 2
            } else {
                right = min(right!, (new + past) / 2)
            }
        } else {
            if left == nil {
                left = (new + past) / 2
            } else {
                left = max(left!, (new + past) / 2)
            }
        }
    case "further":
        if new < past {
            if left == nil {
                left = (new + past) / 2
            } else {
                left = max(left!, (new + past) / 2)
            }
        } else {
            if right == nil {
                right = (new + past) / 2
            } else {
                right = min(right!, (new + past) / 2)
            }
        }
    default:
        break
    }
    
    past = new
}

if left == nil {
    right = round(1000000 * right!) / 1000000.0
    print(30.0, right!)
} else if right == nil {
    left = round(1000000 * left!) / 1000000.0
    print(left!, 4000.0)
} else {
    left = round(1000000 * left!) / 1000000.0
    right = round(1000000 * right!) / 1000000.0
    print(left!, right!)
}

