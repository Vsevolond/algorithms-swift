//
//  main.swift
//  dictionaryOfSynonyms
//
//  Created by Всеволод on 17.05.2023.
//

import Foundation

let n = Int(readLine()!)!
var dict = [String : String]()
for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    dict[input[0]] = input[1]
    dict[input[1]] = input[0]
}

let word = readLine()!

guard let result = dict[word] else {
    exit(0)
}
print(result)

