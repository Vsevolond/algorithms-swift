import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let a: Int = input[0]
let b: Int = input[1]

print(a * b - 1)
