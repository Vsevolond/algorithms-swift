//
//  main.swift
//  cubes
//
//  Created by Всеволод on 09.03.2023.
//

import Foundation

let str = readLine()!.split(separator: " ").map { Int($0)! }
let n = str[0], m = str[1]

var arrA = [Int](), arrB = [Int]()
var setOfColors = Set<Int>()

for _ in 0..<n {
    let x = Int(readLine()!)!
    arrA.append(x)
    setOfColors.insert(x)
}

for _ in 0..<m {
    let x = Int(readLine()!)!
    arrB.append(x)
    setOfColors.insert(x)
}

var colorsA = [Int : Int]()
var colorsB = [Int : Int]()

for x in arrA {
    if colorsA[x] == nil {
        colorsA[x] = 1
    } else {
        colorsA[x]! += 1
    }
}

for x in arrB {
    if colorsB[x] == nil {
        colorsB[x] = 1
    } else {
        colorsB[x]! += 1
    }
}


var intersection = [Int]()
var otherA = [Int]()
var otherB = [Int]()

for color in setOfColors.sorted() {
    if colorsA[color] != nil && colorsB[color] != nil {
        let m = max(colorsA[color]!, colorsB[color]!)
        (0..<m).forEach { _ in
            intersection.append(color)
        }
        
        colorsA[color]! -= m
        colorsB[color]! -= m
    }
    
    if colorsA[color] != nil {
        (0..<colorsA[color]!).forEach { _ in
            otherA.append(color)
        }
    }
    
    if colorsB[color] != nil {
        (0..<colorsB[color]!).forEach { _ in
            otherB.append(color)
        }
    }
}


print(intersection.count)
intersection.forEach {
    print($0, terminator: " ")
}
print()

print(otherA.count)
otherA.forEach {
    print($0, terminator: " ")
}
print()

print(otherB.count)
otherB.forEach {
    print($0, terminator: " ")
}
print()
