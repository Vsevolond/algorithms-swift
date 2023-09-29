//
//  main.swift
//  substring
//
//  Created by Всеволод on 23.05.2023.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

let str = readLine()!.split(separator: "").map { String($0) }
var unique = Set<String>()
str.forEach { chr in
    unique.insert(chr)
}

var left = 0
var right = 0
var len = 1
var begin = 0
var dict: [String: Int] = [str[0] : 1]
var container: Set<String> = [str[0]]

while left != n - 1 {
    let leftSym = str[left]
    let rightSym = str[right]
    
    if (dict[leftSym]! > k || right == n - 1) && left != right {
        dict[leftSym]! -= 1
        left += 1
        
        if dict[leftSym] == k {
            container.insert(leftSym)
        }
        
    } else if dict[rightSym]! > k && left != right {
        dict[leftSym]! -= 1
        left += 1
        
        if dict[rightSym] == k {
            container.insert(rightSym)
        }
        
    } else if right != n - 1 {
        right += 1
        let newSym = str[right]
        
        if dict[newSym] == nil {
            dict[newSym] = 1
            container.insert(newSym)
        } else {
            dict[newSym]! += 1
            if dict[newSym]! > k {
                container.remove(newSym)
            }
        }
    }
    
    if container.count == unique.count && len < right - left + 1 {
        len = right - left + 1
        begin = left
    }
}

print(len, terminator: " ")
print(begin + 1)


