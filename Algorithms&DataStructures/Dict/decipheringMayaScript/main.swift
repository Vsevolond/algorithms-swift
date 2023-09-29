//
//  main.swift
//  decipheringMayaScript
//
//  Created by Всеволод on 18.05.2023.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let k = input[0]
let n = input[1]
let gstr = readLine()!
let sstr = readLine()!

var base = [Character: Int]()
for chr in gstr {
    if base[chr] == nil {
        base[chr] = 1
    } else {
        base[chr]! += 1
    }
}

var dict = [Character: Int]()
var window = (left: sstr.startIndex, right: sstr.index(sstr.startIndex, offsetBy: k))
for chr in sstr[window.left..<window.right] {
    if dict[chr] == nil {
        dict[chr] = 1
    } else {
        dict[chr]! += 1
    }
}

var similars = 0
for (chr, count) in dict {
    if let basecount = base[chr], basecount == count {
        similars += 1
    }
}

var res: Int = (similars == base.count) ? 1 : 0
for _ in 1...(n - k) {
    let outsym = sstr[window.left]
    dict[outsym]! -= 1
    
    if let basecount = base[outsym], let count = dict[outsym] {
        if basecount == count {
            similars += 1
        } else if basecount == count + 1 {
            similars -= 1
        }
    }
    
    let newsym = sstr[window.right]
    if dict[newsym] == nil {
        dict[newsym] = 1
    } else {
        dict[newsym]! += 1
    }
    
    if let basecount = base[newsym], let count = dict[newsym] {
        if basecount == count {
            similars += 1
        } else if basecount == count - 1 {
            similars -= 1
        }
    }
    
    if similars == base.count {
        res += 1
    }
    
    window.left = sstr.index(after: window.left)
    window.right = sstr.index(after: window.right)
}

print(res)

