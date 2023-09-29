//
//  main.swift
//  improvingPerformance
//
//  Created by Всеволод on 25.05.2023.
//

import Foundation


func check(countOfFive: Int, parameters: [Int]) -> Bool {
    let countOfTwo = parameters[0],
        countOfThree = parameters[1],
        countOfFour = parameters[2]
    
    let count = countOfTwo + countOfThree + countOfFour + countOfFive
    
    return 2 * (countOfTwo * 2 + countOfThree * 3 + countOfFour * 4 + countOfFive * 5) >= count * 7
    
}


func lbinsearch(left: Int, right: Int, checkParameters: [Int]) -> Int {
    var l = left, r = right
    while l < r {
        let m = (l + r) / 2
        if check(countOfFive: m, parameters: checkParameters) {
            r = m
        } else {
            l = m + 1
        }
    }
    
    return l
}

let a = Int(readLine()!)! // 2
let b = Int(readLine()!)! // 3
let c = Int(readLine()!)! // 4

print(lbinsearch(left: 0, right: a + b + c, checkParameters: [a, b, c]))

