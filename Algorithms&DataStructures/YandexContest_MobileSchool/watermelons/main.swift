import Foundation

let capacity: Int = readLine()!.split(separator: " ").map { Int(String($0))! }[1]

var watermelons: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

watermelons.sort()

var i: Int = 0
var j: Int = watermelons.count - 1

var count: Int = 0
var isImpossible: Bool = false

while i <= j, !isImpossible {
    
    var container: Int = 0
    
    while i <= j, container + watermelons[j] <= capacity {
        container += watermelons[j]
        j -= 1
    }
    
    while i <= j, container + watermelons[i] <= capacity {
        container += watermelons[i]
        i += 1
    }
    
    if container == 0, i <= j {
        isImpossible = true
        
    } else {
        count += 1
    }
}

if isImpossible {
    print("Impossible")
    
} else {
    print(count)
}
