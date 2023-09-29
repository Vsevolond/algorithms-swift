//
//  main.swift
//  bannerAdvertising
//
//  Created by Всеволод on 30.04.2023.
//

import Foundation

enum Colors: String {
    case B
    case R
    case Y
    case P
    case G
    case O
    case V
    case D
}

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

let defaultColor: [Colors : Bool] = [.D : true]
var banner = Array(repeating: Array(repeating: defaultColor, count: m), count: n)

for i in 0..<n {
    let lampB = readLine()!.split(separator: "").map { Int($0)! }
    
    for j in 0..<lampB.count {
        if lampB[j] == 0 {
            banner[i][j][.B] = false
            banner[i][j][.P] = false
            banner[i][j][.G] = false
            banner[i][j][.V] = false
        } else {
            banner[i][j][.B] = true
            banner[i][j][.P] = true
            banner[i][j][.G] = true
            banner[i][j][.V] = true
        }
    }
}

for i in 0..<n {
    let lampR = readLine()!.split(separator: "").map { Int($0)! }
    
    for j in 0..<lampR.count {
        if lampR[j] == 0 {
            banner[i][j][.R] = false
            banner[i][j][.P] = false
            banner[i][j][.O] = false
            banner[i][j][.V] = false
        } else {
            banner[i][j][.R] = true
            banner[i][j][.O] = true
        }
    }
}

for i in 0..<n {
    let lampY = readLine()!.split(separator: "").map { Int($0)! }
    
    for j in 0..<lampY.count {
        if lampY[j] == 0 {
            banner[i][j][.Y] = false
            banner[i][j][.G] = false
            banner[i][j][.O] = false
            banner[i][j][.V] = false
        } else {
            banner[i][j][.Y] = true
        }
    }
}

for i in 0..<n {
    let order = readLine()!.split(separator: "").map { String($0) }
    
    for j in 0..<order.count {
        if let color = Colors(rawValue: order[j]) {
            if banner[i][j][color] == false {
                print("NO")
                exit(0)
            }
        }
    }
}

print("YES")

