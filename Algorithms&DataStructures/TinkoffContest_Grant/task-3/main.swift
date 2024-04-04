import Foundation

let candies = readLine()!.split(separator: " ").map { Int(String($0))! }

let sum: Int = candies.reduce(into: 0) { $0 += $1 }

if sum % 4 == 0 {
    let mid: Int = sum / 4
    let count: Int = candies.filter { $0 < mid }.count
    print(count)
    
} else {
    print(-1)
}
