//
//  main.swift
//  stressControl
//
//  Created by Всеволод on 19.05.2023.
//

import Foundation

let n = Int(readLine()!)!
var dict = [String: Set<String>]()

func stresses(of word: String) -> Int {
    var stresses = 0
    for chr in word {
        if chr.isUppercase {
            stresses += 1
        }
    }
    
    return stresses
}

for _ in 0..<n {
    let input = readLine()!
    let lower = input.lowercased()
    if dict[lower] == nil {
        dict[lower] = Set<String>()
    }
    dict[lower]?.insert(input)
}

let text = readLine()!.split(separator: " ").map { String($0) }

var mistakes = 0
for word in text {
    let lower = word.lowercased()
    if let dictLower = dict[lower] {
        if !dictLower.contains(word) {
            mistakes += 1
        }
    } else {
        let stresses = stresses(of: word)
        if stresses != 1 {
            mistakes += 1
        }
    }
}

print(mistakes)

