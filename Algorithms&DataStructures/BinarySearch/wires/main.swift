//
//  main.swift
//  wires
//
//  Created by Всеволод on 02.06.2023.
//

import Foundation

func check(length: Int, wires: [Int], needCount: Int) -> Bool {
    var count = 0
    for wire in wires {
        count += (wire / length)
    }
    
    return count >= needCount
}

func rbinsearch(left: Int, right: Int, wires: [Int], needCount: Int) -> Int {
    var l = left, r = right
    while l < r {
        let m = (l + r + 1) / 2
        if check(length: m, wires: wires, needCount: needCount) {
            l = m
        } else {
            r = m - 1
        }
    }
    
    return l
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

var wires = [Int]()
var max = -1
(1...n).forEach { _ in
    let wire = Int(readLine()!)!
    wires.append(wire)
    
    if wire > max {
        max = wire
    }
}

let length = rbinsearch(left: 0, right: max, wires: wires, needCount: k)
print(length)
