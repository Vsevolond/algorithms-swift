//
//  main.swift
//  sequenceType
//
//  Created by Всеволод on 24.02.2023.
//

import Foundation

var a: [Int] = []

var val = Int(readLine()!)!

while val != -2000000000 {
    a.append(val)
    val = Int(readLine()!)!
}

var ascending = false, descending = false, constant = false

for i in 1..<a.count {
    if a[i] > a[i - 1] {
        ascending = true;
    } else if a[i] < a[i - 1] {
        descending = true;
    } else {
        constant = true;
    }
}

if constant {
    if ascending && descending {
        print("RANDOM")
    } else if ascending {
        print("WEAKLY ASCENDING")
    } else if descending {
        print("WEAKLY DESCENDING")
    } else {
        print("CONSTANT")
    }
} else {
    if ascending && descending {
        print("RANDOM")
    } else if ascending {
        print("ASCENDING")
    } else if descending {
        print("DESCENDING")
    }
}




