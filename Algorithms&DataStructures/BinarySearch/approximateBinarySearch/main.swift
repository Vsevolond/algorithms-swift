//
//  main.swift
//  approximateBinarySearch
//
//  Created by Всеволод on 24.05.2023.
//

import Foundation

func approximateBinarySearch(in array: [Int], number: Int) -> Int {
    var left = 0
    var right = array.count - 1
    
    while left < right {
        let m = (left + right) / 2
        if array[m] < number {
            left = m + 1
        } else if array[m] > number {
            right = m
        } else {
            return number
        }
    }
    
    if left == 0 {
        return array[left]
    } else {
        if number - array[left - 1] > array[left] - number {
            return array[left]
        } else {
            return array[left - 1]
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

let array = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

for number in numbers {
    print(approximateBinarySearch(in: array, number: number))
}

