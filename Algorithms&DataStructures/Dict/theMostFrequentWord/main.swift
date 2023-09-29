//
//  main.swift
//  theMostFrequentWord
//
//  Created by Всеволод on 17.05.2023.
//

import Foundation

let fileName = "/Users/vsevolod/Documents/IOS/IOS_projects/Algorithms&DataStructures/Dict/theMostFrequentWord/input.txt"

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

func oftenWord(of text: [String]) -> String {
    var dict = [String: Int]()
    var oftenWord = ""
    var maxCount = 0
    
    for word in text {
        if dict[word] == nil {
            dict[word] = 1
        } else {
            dict[word]! += 1
        }
        
        guard let count = dict[word] else {
            continue
        }
        
        if count > maxCount {
            maxCount = count
            oftenWord = word
        } else if count == maxCount && word < oftenWord {
            oftenWord = word
        }
    }
    
    return oftenWord
}

let text = readFromFile()
print(oftenWord(of: text))

