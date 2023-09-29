//
//  main.swift
//  stylishClothes
//
//  Created by Всеволод on 22.05.2023.
//

import Foundation

let n = Int(readLine()!)!
var shirts = readLine()!.split(separator: " ").map { Int($0)! }

let m = Int(readLine()!)!
var shorts = readLine()!.split(separator: " ").map { Int($0)! }

var first = 0
var second = 0
var clothes = (shirt: shirts[first], short: shorts[second])
var diff = abs(shirts[first] - shorts[second])

while first != shirts.count && second != shorts.count && diff != 0 {
    if abs(shirts[first] - shorts[second]) < diff {
        clothes.shirt = shirts[first]
        clothes.short = shorts[second]
        diff = abs(shirts[first] - shorts[second])
    }
    
    if shirts[first] < shorts[second] {
        first += 1
    } else if shirts[first] > shorts[second] {
        second += 1
    }
}

print(clothes.shirt, terminator: " ")
print(clothes.short)





