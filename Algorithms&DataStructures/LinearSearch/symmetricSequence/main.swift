//
//  main.swift
//  symmetricSequence
//
//  Created by Всеволод on 24.02.2023.
//

import Foundation

func isSym(arr: [Int], left: Int) -> Bool {
    var _isSym = true
    var l = left, r = n - 1
    
    while l <= r && _isSym {
        _isSym = (arr[l] == arr[r])
        l += 1
        r -= 1
    }
    
    return _isSym
}


let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0

for i in 0..<n {
    if arr[i] == arr[n - 1] && isSym(arr: arr, left: i) {
        left = i
        break
    }
}

print(left)

if left != 0 {
    arr[0..<left].reversed().forEach { print($0, terminator: " ") }
}




