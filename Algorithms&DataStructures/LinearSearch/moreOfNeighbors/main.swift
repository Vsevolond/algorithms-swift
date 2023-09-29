//
//  main.swift
//  moreofneighbors
//
//  Created by Всеволод on 24.02.2023.
//

import Foundation

let a = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }

var i = 1
let n = a.count

var cnt = 0

while i < n - 1 {
    if a[i - 1] < a[i] && a[i] > a[i + 1] {
        cnt += 1
        i += 1
    }
    i += 1
}

print(cnt)



