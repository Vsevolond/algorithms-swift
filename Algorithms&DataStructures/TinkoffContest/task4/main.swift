//
//  main.swift
//  task4
//
//  Created by Всеволод on 19.03.2023.
//

import Foundation


func check(counts: [Int : Int]) -> Bool {
    let values = counts.values.filter { $0 != 0 }
    let unique = Array(Set(values))

    if unique.count == 1 {
        return true
    } else if unique.count == 2 && abs(unique[0] - unique[1]) == 1 &&
        (values.filter({ $0 == unique[0] }).count == 1 || values.filter({ $0 == unique[1] }).count == 1) {
        return true
    }
    
    return false
}



let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var counts: [Int : Int] = [:]

for x in arr {
    if counts[x] == nil {
        counts[x] = 1
    } else {
        counts[x]! += 1
    }
}

var prefix = 2

for i in (2..<n).reversed() {
    if check(counts: counts) {
        prefix = i + 1
        break
    } else {
        counts[arr[i]]! -= 1
    }
}

print(prefix)



