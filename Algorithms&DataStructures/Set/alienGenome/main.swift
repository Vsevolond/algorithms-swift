//
//  main.swift
//  alienGenome
//
//  Created by Всеволод on 21.03.2023.
//

import Foundation


func pairs(from genome: [String]) -> [String : Int] {
    guard genome.count >= 2 else {
        return [:]
    }
    
    var pairs = [String : Int]()
    
    for i in 1..<genome.count {
        let pair = genome[i-1] + genome[i]
        if pairs[pair] != nil {
            pairs[pair]! += 1
        } else {
            pairs[pair] = 1
        }
    }
    
    return pairs
}

let genome1 = readLine()!.split(separator: "").map { String($0) }
let genome2 = readLine()!.split(separator: "").map { String($0) }


let pairs1 = pairs(from: genome1)
let pairs2 = pairs(from: genome2)


var count = 0

for (pair, cnt) in pairs1 {
    if pairs2[pair] != nil {
        count += cnt
    }
}

print(count)




