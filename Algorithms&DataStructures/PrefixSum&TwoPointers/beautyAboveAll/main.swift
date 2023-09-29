//
//  main.swift
//  beautyAboveAll
//
//  Created by Всеволод on 22.05.2023.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

let trees = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = -1
var sorts = [Int: Int]()

while right != n && sorts.count != k {
    right += 1
    let tree = trees[right]
    
    if sorts[tree] == nil {
        sorts[tree] = 1
    } else {
        sorts[tree]! += 1
    }
}

var window = (left: left, right: right)
var min = right - left + 1

left = 1
while left != n {
    let tree = trees[left - 1]
    sorts[tree]! -= 1
    
    while right != n - 1 && sorts[tree] == 0 {
        right += 1
        let newTree = trees[right]
        
        if sorts[newTree] == nil {
            sorts[newTree] = 1
        } else {
            sorts[newTree]! += 1
        }
    }
    
    if sorts[tree]! > 0 {
        if (right - left + 1) < min {
            min = right - left + 1
            window = (left, right)
        }
    } else {
        break
    }
    
    left += 1
}

print(window.left + 1, terminator: " ")
print(window.right + 1)
