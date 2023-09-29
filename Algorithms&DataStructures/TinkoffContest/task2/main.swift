//
//  main.swift
//  task2
//
//  Created by Всеволод on 19.03.2023.
//

import Foundation

let str = readLine()!.split(separator: " ").map { Int($0)! }

let n = str[0], m = str[1], k = str[2]

var arr = Array(repeating: 0, count: n)

var flag = false
var i = 0, seniors = 0
var minutes = 0

while i < n {
    minutes += 1
    
    seniors = m - arr[i]
    
    while seniors > 0 && i < n {
        if arr[i] > 0 && arr[i] < k {
            seniors -= (k - arr[i])
            seniors += arr[i]
            arr[i] = k
            i += 1
        } else if arr[i] == 0 {
            if seniors / k > 0 {
                arr[i] += k
                seniors -= k
                i += 1
            } else {
                arr[i] = seniors
                seniors = 0
            }
        }
    }
}

print(minutes)

