//
//  main.swift
//  cowcakeThrowChamp
//
//  Created by Всеволод on 24.02.2023.
//

import Foundation

let n = Int(readLine()!)!

let a = readLine()!.split(separator: " ").map { Int($0)! }

var max = a[0]
var possibles: [Int] = []

for i in 0..<n-1 {
    if a[i] % 10 == 5 && a[i + 1] < a[i] {
        possibles.append(i)
    }
    if max < a[i] {
        max = a[i]
    }
}

guard !possibles.isEmpty else {
    print(0)
    exit(0)
}

var m: Int?

for i in 0..<n - 2 {
    if a[i] == max {
        for x in possibles {
            if x > i && (m == nil || m! < a[x]) {
                m = a[x]
            }
        }
    }
}

guard m != nil else {
    print(0)
    exit(0)
}

var place = 1;
for x in a {
    if x > m! {
        place += 1
    }
}

print(place)

