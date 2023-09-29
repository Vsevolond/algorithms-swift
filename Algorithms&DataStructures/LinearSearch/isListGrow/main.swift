//
//  main.swift
//  isListGrow
//
//  Created by Всеволод on 24.02.2023.
//

import Foundation

let a = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }

var isGrow = true

for i in 1..<a.count {
    if a[i - 1] >= a[i] {
        isGrow = false
        break
    }
}

print(isGrow ? "YES" : "NO")

