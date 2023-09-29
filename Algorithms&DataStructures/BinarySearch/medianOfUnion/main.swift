//
//  main.swift
//  medianOfUnion
//
//  Created by Всеволод on 02.06.2023.
//

import Foundation


func merge(array1: [Int], array2: [Int]) -> [Int] {
    var first = 0, second = 0
    var res = [Int]()
    while first != array1.count && second != array2.count {
        if first == array1.count {
            res.append(array2[second])
            second += 1
        } else if second == array2.count {
            res.append(array1[first])
            first += 1
        } else {
            if array1[first] < array2[second] {
                res.append(array1[first])
                first += 1
            } else {
                res.append(array2[second])
                second += 1
            }
        }
    }
    
    return res
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], l = input[1]

var arrays = [[Int]]()

(1...n).forEach { _ in
    let array = readLine()!.split(separator: " ").map { Int($0)! }
    arrays.append(array)
}

for i in 0..<(n - 1) {
    for j in (i + 1)..<n {
        let merge = merge(array1: arrays[i], array2: arrays[j])
        print(merge[l - 1])
    }
}

