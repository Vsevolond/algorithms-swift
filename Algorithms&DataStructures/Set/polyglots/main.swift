//
//  main.swift
//  polyglots
//
//  Created by Всеволод on 21.03.2023.
//

import Foundation

let n = Int(readLine()!)!

var dict = [String : Int]()

for _ in 1...n {
    let m = Int(readLine()!)!
    
    for _ in 1...m {
        let language = readLine()!
        
        if dict[language] != nil {
            dict[language]! += 1
        } else {
            dict[language] = 1
        }
    }
}

var general = [String]()
var all = [String]()

for (language, cnt) in dict {
    if cnt == n {
        general.append(language)
    }
    
    all.append(language)
}

print(general.count)
general.forEach { language in
    print(language)
}

print(all.count)
all.forEach { language in
    print(language)
}

