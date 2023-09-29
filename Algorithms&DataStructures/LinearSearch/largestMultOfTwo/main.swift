//
//  main.swift
//  largestMult
//
//  Created by Всеволод on 27.02.2023.
//

import Foundation

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var positive1, positive2, negative1, negative2: Int?

for i in 0..<arr.count {
    if arr[i] < 0 { // negative
        if negative2 == nil {
            negative2 = arr[i]
        } else if negative1 == nil {
            if arr[i] > negative2! {
                negative1 = negative2
                negative2 = arr[i]
            } else {
                negative1 = arr[i]
            }
        } else {
            if arr[i] < negative1! {
                negative2 = negative1
                negative1 = arr[i]
            } else if arr[i] < negative2! {
                negative2 = arr[i]
            }
        }
    } else { // positive
        if positive2 == nil {
            positive2 = arr[i]
        } else if positive1 == nil {
            if arr[i] > positive2! {
                positive1 = positive2
                positive2 = arr[i]
            } else {
                positive1 = arr[i]
            }
        } else {
            if arr[i] > positive2! {
                positive1 = positive2
                positive2 = arr[i]
            } else if arr[i] > positive1! {
                positive1 = arr[i]
            }
        }
    }
}

var res = [negative1, negative2, positive1, positive2].filter { $0 != nil}.map { $0! }
var first = res[0], second = res[1]
var mult = first * second



for i in 0..<res.count {
    for j in i+1..<res.count {
        if res[i] * res[j] > mult {
            mult = res[i] * res[j]
            first = res[i]
            second = res[j]
        }
    }
}

print(first, second)
