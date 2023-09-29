//
//  main.swift
//  task5
//
//  Created by Всеволод on 19.03.2023.
//

import Foundation


let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var prefixsum = Array(repeating: 0, count: n)
var s = 0
for i in 0..<n {
    s += arr[i]
    prefixsum[i] = s
}

var count = 0
var last_i = -1

for i in 0..<n {
    for j in i..<n {
        let sum = prefixsum[j] - prefixsum[i] + arr[i]
        
        if sum == 0 {
            let dup = (i - last_i) * (n - j)
            count += dup
            last_i = i
        }
    }
}

print(count)


