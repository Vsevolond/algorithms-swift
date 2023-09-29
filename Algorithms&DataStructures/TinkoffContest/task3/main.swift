//
//  main.swift
//  task3
//
//  Created by Всеволод on 19.03.2023.
//

import Foundation


let n = Int(readLine()!)!

let str = readLine()!.split(separator: "").map { String($0) }

var dict: [String : Int] = [:]

for char in str {
    if dict[char] == nil {
        dict[char] = 1
    } else {
        dict[char]! += 1
    }
}

guard dict.count == 4 else {
    print(-1)
    exit(0)
}

var left = 0, right = n - 1
var flag = false
var dict1 = dict

while !flag {
    let leftChar = str[left], rightChar = str[right]
    if dict1[leftChar]! - 1 == 0 && dict1[rightChar]! - 1 == 0 {
        flag = true
    } else if dict1[leftChar]! - 1 > 0 {
        dict1[leftChar]! -= 1
        left += 1
    } else if dict1[rightChar]! - 1 > 0 {
        dict1[rightChar]! -= 1
        right -= 1
    }
}



var len = right - left + 1


left = 0
right = n - 1
flag = false
var dict2 = dict

while !flag {
    let leftChar = str[left], rightChar = str[right]
    if dict2[leftChar]! - 1 == 0 && dict2[rightChar]! - 1 == 0 {
        flag = true
    } else if dict2[rightChar]! - 1 > 0 {
        dict2[rightChar]! -= 1
        right -= 1
    } else if dict2[leftChar]! - 1 > 0 {
        dict2[leftChar]! -= 1
        left += 1
    }
}


len = min(len, right - left + 1)

print(len)
