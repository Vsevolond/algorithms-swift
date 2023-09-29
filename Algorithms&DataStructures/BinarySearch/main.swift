//
//  main.swift
//  binarySearch
//
//  Created by Vsevolod Donchenko on 25.07.2023.
//

import Foundation

func binarySearch(in array: [Int], number: Int) -> Bool {
    var l = 0
    var r = array.count - 1
    
    while l <= r {
        let m = (l + r) / 2
        if array[m] < number {
            l = m + 1
        } else if array[m] > number {
            r = m - 1
        } else {
            return true
        }
    }
    
    return false
}
 
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

let array = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

for number in numbers {
    if binarySearch(in: array, number: number) {
        print("YES")
    } else {
        print("NO")
    }
}

