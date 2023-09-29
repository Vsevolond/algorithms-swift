//
//  main.swift
//  openCalculator
//
//  Created by Всеволод on 21.03.2023.
//

import Foundation

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var digits: [Bool] = Array(repeating: false, count: 10)

arr.forEach { x in
    digits[x] = true
}

let number = readLine()!.split(separator: "").map { Int($0)! }

var count = 0

number.forEach { x in
    if !digits[x] {
        count += 1
        digits[x] = true
    }
}

print(count)
