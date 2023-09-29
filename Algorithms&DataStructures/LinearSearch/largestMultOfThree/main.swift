//
//  main.swift
//  largestMultOfThree
//
//  Created by Всеволод on 27.02.2023.
//

import Foundation

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var positive1, positive2, positive3, negative1, negative2, negative3: Int?
var maxNeg1, maxNeg2: Int?

for i in 0..<arr.count {
    if arr[i] < 0 { // negative
        if maxNeg2 == nil { // min
            maxNeg2 = arr[i]
        } else if maxNeg1 == nil {
            if arr[i] > maxNeg2! {
                maxNeg1 = maxNeg2
                maxNeg2 = arr[i]
            } else {
                maxNeg1 = arr[i]
            }
        } else {
            if arr[i] < maxNeg1! {
                maxNeg2 = maxNeg1
                maxNeg1 = arr[i]
            } else if arr[i] < maxNeg2! {
                maxNeg2 = arr[i]
            }
        }
        
        if negative3 == nil { // max
            negative3 = arr[i]
        } else if negative2 == nil {
            if arr[i] > negative3! {
                negative2 = negative3
                negative3 = arr[i]
            } else {
                negative2 = arr[i]
            }
        } else if negative1 == nil {
            if arr[i] > negative3! {
                negative1 = negative2
                negative2 = negative3
                negative3 = arr[i]
            } else if arr[i] > negative2! {
                negative1 = negative2
                negative2 = arr[i]
            } else {
                negative1 = arr[i]
            }
        } else {
            if arr[i] > negative3! {
                negative1 = negative2
                negative2 = negative3
                negative3 = arr[i]
            } else if arr[i] > negative2! {
                negative1 = negative2
                negative2 = arr[i]
            } else if arr[i] > negative1! {
                negative1 = arr[i]
            }
        }
    } else { // positive
        if positive3 == nil {
            positive3 = arr[i]
        } else if positive2 == nil {
            if arr[i] > positive3! {
                positive2 = positive3
                positive3 = arr[i]
            } else {
                positive2 = arr[i]
            }
        } else if positive1 == nil {
            if arr[i] > positive3! {
                positive1 = positive2
                positive2 = positive3
                positive3 = arr[i]
            } else if arr[i] > positive2! {
                positive1 = positive2
                positive2 = arr[i]
            } else {
                positive1 = arr[i]
            }
        } else {
            if arr[i] > positive3! {
                positive1 = positive2
                positive2 = positive3
                positive3 = arr[i]
            } else if arr[i] > positive2! {
                positive1 = positive2
                positive2 = arr[i]
            } else if arr[i] > positive1! {
                positive1 = arr[i]
            }
        }
    }
}

var res = [negative1, negative2, negative3, positive1, positive2, positive3].filter { $0 != nil}.map { $0! }
var first = res[0], second = res[1], third = res[2]
var mult = first * second * third

for i in 0..<res.count {
    for j in i+1..<res.count {
        for k in j+1..<res.count {
            if res[i] * res[j] * res[k] > mult {
                mult = res[i] * res[j] * res[k]
                first = res[i]
                second = res[j]
                third = res[k]
            }
        }
    }
}

if maxNeg1 != nil && maxNeg2 != nil {
    res = [positive1, positive2, positive3].filter { $0 != nil}.map { $0! }
    for x in res {
        if maxNeg1! * maxNeg2! * x > mult {
            first = maxNeg1!
            second = maxNeg2!
            third = x
            mult = maxNeg1! * maxNeg2! * x
        }
    }
}


print(first, second, third)
