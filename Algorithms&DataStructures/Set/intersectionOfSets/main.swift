//
//  main.swift
//  intersectionOfSets
//
//  Created by Всеволод on 09.03.2023.
//

import Foundation

let arr1 = readLine()!.split(separator: " ").map { Int($0)! }
let arr2 = readLine()!.split(separator: " ").map { Int($0)! }

let size = max(arr1.max()!, arr2.max()!) + 1
var diff = Array(repeating: 0, count: size)

for x in arr1 {
    diff[x] += 1
}

for x in arr2 {
    diff[x] += 1
}

var res = [Int]()
for i in 0..<diff.count {
    if diff[i] > 1 {
        (0..<diff[i]/2).forEach { _ in
            res.append(i)
        }
    }
}

res.forEach {
    print($0, terminator: " ")
}



