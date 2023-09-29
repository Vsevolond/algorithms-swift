//
//  main.swift
//  theCityChe
//
//  Created by Всеволод on 22.05.2023.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], r = input[1]

let dist = readLine()!.split(separator: " ").map { Int($0)! }

var count = 0
var left = 0
var right = 0

while left != n {
    while right != n && dist[right] - dist[left] <= r {
        right += 1
    }
    
    count += n - right
    left += 1
}

print(count)

