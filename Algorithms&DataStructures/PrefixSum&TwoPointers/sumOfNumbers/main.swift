//
//  main.swift
//  sumOfNumbers
//
//  Created by Всеволод on 22.05.2023.
//

import Foundation

func prefixsum(of array: [Int]) -> [Int] {
    var prefixsum = Array(repeating: 0, count: array.count + 1)
    for i in 1..<prefixsum.count {
        prefixsum[i] = prefixsum[i - 1] + array[i - 1]
    }
    
    return prefixsum
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let prefix = prefixsum(of: numbers)

var left = 0
var right = 0
var count = 0

while right != prefix.count && left != prefix.count {
    if prefix[right] - prefix[left] == k {
        count += 1
        left += 1
    } else if prefix[right] - prefix[left] > k {
        left += 1
    } else {
        right += 1
    }
}

print(count)

