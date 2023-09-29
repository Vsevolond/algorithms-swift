//
//  main.swift
//  snowmanForHarry
//
//  Created by Всеволод on 30.04.2023.
//

import Foundation

let n = Int(readLine()!)!
let snows = readLine()!.split(separator: " ").map { Int($0)! }

var dict: [Int : Bool] = [:]
for i in 1...n {
    dict[i] = false
}

var currentSnow = n

for snow in snows {
    dict[snow] = true
    
    if snow == currentSnow {
        var ans = [Int]()
        
        while currentSnow != 0 {
            if dict[currentSnow] == true {
                ans.append(currentSnow)
            } else {
                break
            }
            currentSnow -= 1
        }
        ans.forEach { a in
            print(a, terminator: " ")
        }
    }
    
    print()
}

var foo1 = NSObject()
var foo2: NSObject = foo1

