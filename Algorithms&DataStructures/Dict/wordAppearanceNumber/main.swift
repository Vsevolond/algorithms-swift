//
//  main.swift
//  wordAppearanceNumber
//
//  Created by Всеволод on 17.05.2023.
//

import Foundation

let fileName = "/Users/vsevolod/Documents/IOS/IOS_projects/Algorithms&DataStructures/Dict/wordAppearanceNumber/input.txt"

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

func count(text: [String]) -> String {
    var counts = [Int]()
    var dict = [String : Int]()

    for word in text {
        if dict[word] == nil {
            counts.append(0)
            dict[word] = 1
        } else {
            counts.append(dict[word]!)
            dict[word]! += 1
        }
    }
    
    return counts.map({ String($0) }).joined(separator: " ")
}

let text = readFromFile()
print(count(text: text))


