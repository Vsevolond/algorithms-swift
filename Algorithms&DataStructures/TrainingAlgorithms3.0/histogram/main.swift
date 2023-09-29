//
//  main.swift
//  histogram
//
//  Created by Всеволод on 05.06.2023.
//

import Foundation

let fileName = "/Users/vsevolod/Documents/IOS/IOS_projects/Algorithms&DataStructures/TrainingAlgorithms3.0/histogram/input.txt"

func readFromFile() -> [String] {
    guard let text = try? String(contentsOfFile: fileName) else {
        return []
    }
    let split = text.split(separator: "\n")
    var res: [String] = []
    
    for line in split {
        let splitLine = line.components(separatedBy: CharacterSet(charactersIn: " ")).filter { !$0.isEmpty }
        res.append(contentsOf: splitLine)
    }
    
    return res
}


let words = readFromFile()
var dict = [Character: Int]()
var unique = Set<Character>()

var maxcount = 0
for word in words {
    for sym in word {
        unique.insert(sym)
        
        if dict[sym] != nil {
            dict[sym]! += 1
        } else {
            dict[sym] = 1
        }
        
        maxcount = max(maxcount, dict[sym]!)
    }
}

var str = ""
for sym in unique.sorted() {
    str += String(sym)
}

for curCount in stride(from: maxcount, to: 0, by: -1) {
    for sym in str {
        guard let count = dict[sym] else {
            exit(0)
        }
        
        if count == curCount {
            print("#", terminator: "")
            dict[sym]! -= 1
        } else {
            print(" ", terminator: "")
        }
    }
    print()
}

print(str)
