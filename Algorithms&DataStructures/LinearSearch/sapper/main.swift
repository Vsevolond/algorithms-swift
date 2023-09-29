//
//  main.swift
//  sapper
//
//  Created by Всеволод on 27.02.2023.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], k = input[2]

var arr: [[Int]] = .init(repeating: [Int](repeating: 0, count: m), count: n)

for _ in 0..<k {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    let p = input[0] - 1, q = input[1] - 1
    
    arr[p][q] = -1
    let shifts = [0, -1, +1]
    for shift1 in shifts {
        for shift2 in shifts {
            let x = p + shift1, y = q + shift2
            
            if (x != p || y != q) && (x >= 0 && x < n) && (y >= 0 && y < m) && arr[x][y] != -1 {
                arr[x][y] += 1
            }
        }
    }
}

for a in arr {
    let str = a.map { elem in
        if elem == -1 {
            return "*"
        } else {
            return String(elem)
        }
    }.joined(separator: " ")
    
    print(str)
}


