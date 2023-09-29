//
//  main.swift
//  countOfWords
//
//  Created by Всеволод on 09.03.2023.
//

import Foundation

let fileName = "/Users/vsevolod/Documents/IOS_projects/Algorithms&DataStructures/Set/countOfWords/input.txt"

func readFromFile() -> [String] {
    guard let text = try? String(contentsOfFile: fileName) else {
        return []
    }
    let split = text.split(separator: "\n")
    var res: [String] = []
    
    for line in split {
        let splitLine = line.components(separatedBy: CharacterSet(charactersIn: " ,:;.'!?-()/")).filter { !$0.isEmpty }
        res.append(contentsOf: splitLine)
    }
    
    return res
}



let array = readFromFile()
var dict = [String : Int]()

array.forEach { x in
    let word = x.lowercased()
    if dict[word] != nil {
        dict[word]! += 1
    } else if dict[word] == nil {
        dict[word] = 1
    }
}

print(dict.count)
print(dict)


