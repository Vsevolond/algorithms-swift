//
//  main.swift
//  diplomas
//
//  Created by Всеволод on 25.05.2023.
//

import Foundation

func check(side: Int, parameters: [Int]) -> Bool {
    let w = parameters[0], h = parameters[1], n = parameters[2]
    
    let rows = side / h
    let columns = side / w
    
    return rows * columns >= n
}

func lbinsearch(left: Int, right: Int, checkParameters: [Int]) -> Int {
    var l = left, r = right
    while l < r {
        let m = (l + r) / 2
        if check(side: m, parameters: checkParameters) {
            r = m
        } else {
            l = m + 1
        }
    }
    
    return l
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let w = input[0], h = input[1], n = input[2]

print(lbinsearch(left: 1, right: n * max(w, h), checkParameters: [w, h, n]))



