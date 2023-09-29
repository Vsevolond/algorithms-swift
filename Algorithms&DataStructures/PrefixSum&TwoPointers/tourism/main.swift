//
//  main.swift
//  tourism
//
//  Created by Всеволод on 22.05.2023.
//

import Foundation

func countLift(of array: [Int], isReversed: Bool) -> [Int] {
    var lifts = Array(repeating: 0, count: array.count)
    if isReversed {
        for i in stride(from: array.count - 2, to: -1, by: -1) {
            if array[i] > array[i + 1] {
                lifts[i] = lifts[i + 1] + (array[i] - array[i + 1])
            } else {
                lifts[i] = lifts[i + 1]
            }
        }
    } else {
        for i in 1..<array.count {
            if array[i] > array[i - 1] {
                lifts[i] = lifts[i - 1] + (array[i] - array[i - 1])
            } else {
                lifts[i] = lifts[i - 1]
            }
        }
    }
    
    return lifts
}

let n = Int(readLine()!)!
var trace = [Int]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    trace.append(input[1])
}

let prefix = countLift(of: trace, isReversed: false)
let postfix = countLift(of: trace, isReversed: true)

let m = Int(readLine()!)!
for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let begin = input[0] - 1, end = input[1] - 1
    
    if begin < end {
        print(prefix[end] - prefix[begin])
    } else {
        print(postfix[end] - postfix[begin])
    }
}

