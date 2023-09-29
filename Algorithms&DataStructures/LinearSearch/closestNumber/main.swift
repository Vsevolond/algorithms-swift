//
//  main.swift
//  closestNumber
//
//  Created by Всеволод on 24.02.2023.
//

import Foundation

let n = Int(readLine()!)!

let a = readLine()!.split(separator: " ").map { Int($0)! }

let k = Int(readLine()!)!

var closestMin = -1001, closestMax = 1001

for x in a {
    if x <= k && x > closestMin {
        closestMin = x
    }
    else if x > k && x < closestMax {
        closestMax = x
    }
}

if closestMax == 1001 {
    print(closestMin)
} else if closestMin == -1001 {
    print(closestMax)
} else {
    if closestMax - k < k - closestMin {
        print(closestMax)
    } else {
        print(closestMin)
    }
}



