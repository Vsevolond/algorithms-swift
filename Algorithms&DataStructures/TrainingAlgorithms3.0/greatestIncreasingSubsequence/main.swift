//
//  main.swift
//  greatestIncreasingSubsequence
//
//  Created by Всеволод on 05.06.2023.
//

import Foundation

func slow(array: [Int], n: Int) {
    var dp = Array(repeating: 1, count: n)
    var prev = Array(repeating: -1, count: n)

    for i in 0..<n {
        for j in 0..<i {
            if array[j] < array[i] && dp[j] + 1 > dp[i] {
                dp[i] = dp[j] + 1
                prev[i] = j
            }
        }
    }

    var maxPos = 0
    for i in 1..<n {
        if dp[i] > dp[maxPos] {
            maxPos = i
        }
    }

    var result = [Int]()
    var pos = maxPos
    while pos != -1 {
        result.append(array[pos])
        pos = prev[pos]
    }

    result.reverse()

    for x in result {
        print(x, terminator: " ")
    }
}


func check(number: Int, parameter: Int) -> Bool {
    return number >= parameter
}

func lbinsearch(in array: [Int], left: Int, right: Int, parameter: Int) -> Int {
    var l = left, r = right
    while l < r {
        let m = (l + r) / 2
        
        if check(number: m, parameter: parameter) {
            r = m
        } else {
            l = m + 1
        }
    }
    
    return l
}

func quick(array: [Int], n: Int) {
    var dp = Array(repeating: Int.max, count: n)
    var prev = Array(repeating: -1, count: n)
    
    dp[0] = Int.min
    
    for i in 0..<n {
        let j = lbinsearch(in: dp, left: 0, right: i, parameter: array[i])
        
        
    }
    
}

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

