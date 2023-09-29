//
//  main.swift
//  verySimpleTask
//
//  Created by Всеволод on 25.05.2023.
//

import Foundation

func check(count: Int, parameters: [Int]) -> Bool {
    let n = parameters[0], mintime = parameters[1], maxtime = parameters[2]
    
    return abs(mintime * count - maxtime * (n - count)) <= mintime
}


func lbinsearch(left: Int, right: Int, checkParameters: [Int]) -> Int {
    var l = left, r = right
    while l < r {
        let m = (l + r) / 2
        if check(count: m, parameters: checkParameters) {
            r = m
        } else {
            l = m + 1
        }
    }
    
    return l
}


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] - 1, mintime = min(input[1], input[2]), maxtime = max(input[1], input[2])

let count = lbinsearch(left: 0, right: (mintime + n * maxtime) / (mintime + maxtime), checkParameters: [n, mintime, maxtime])

let time = mintime + max(count * mintime, (n - count) * maxtime)

print(time)

