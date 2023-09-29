//
//  main.swift
//  task1
//
//  Created by Всеволод on 19.03.2023.
//

import Foundation

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var lessEqual = true
var moreEqual = true

for i in 1..<arr.count {
    moreEqual = moreEqual && (arr[i] >= arr[i - 1])
    lessEqual = lessEqual && (arr[i] <= arr[i - 1])
}

if !lessEqual && !moreEqual {
    print("NO")
} else {
    print("YES")
}

