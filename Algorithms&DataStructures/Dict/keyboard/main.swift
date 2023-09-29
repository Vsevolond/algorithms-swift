//
//  main.swift
//  keyboard
//
//  Created by Всеволод on 17.05.2023.
//

import Foundation

let n = Int(readLine()!)!
var counts = readLine()!.split(separator: " ").map { Int($0)! }

let k = Int(readLine()!)!
let clicks = readLine()!.split(separator: " ").map { Int($0)! }

for click in clicks {
    counts[click - 1] -= 1
}

for count in counts {
    if count < 0 {
        print("YES")
    } else {
        print("NO")
    }
}
