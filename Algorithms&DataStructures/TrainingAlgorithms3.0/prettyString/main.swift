//
//  main.swift
//  prettyString
//
//  Created by Всеволод on 05.06.2023.
//

import Foundation

func lenPrettySubString(in str: [String], for sym: String, possibleChanges: Int) -> Int {
    var maxlen = 1
    var count = possibleChanges
    var left = 0, right = 0
    while left != n {
        if right != n && count >= 0 {
            if str[right] != sym {
                count -= 1
            }
            
            right += 1
            
        } else {
            
            if str[right - 1] == sym {
                let len = right - left
                maxlen = max(maxlen, len)
            } else {
                let len = right - left - 1
                maxlen = max(maxlen, len)
            }
            
            if str[left] != sym {
                count += 1
            }
            left += 1
        }
    }
    
    return maxlen
}

func lenPrettySubString(of str: [String]) -> Int {
    var maxlen = 1
    var left = 0, right = 0
    while left != n {
        if right != n && str[right] == str[left] {
            right += 1
        } else {
            let len = right - left
            maxlen = max(maxlen, len)
            
            left += 1
        }
    }
    
    return maxlen
}

let k = Int(readLine()!)!
let str = readLine()!.split(separator: "").map { String($0) }
let n = str.count

var unique = Set<String>()
for sym in str {
    unique.insert(sym)
}

var maxlen = 0

if k == 0 {
    maxlen = lenPrettySubString(of: str)
} else {
    for sym in unique {
        maxlen = max(maxlen, lenPrettySubString(in: str, for: sym, possibleChanges: k))
    }
}

print(maxlen)


//2
//ccbbaaaa
