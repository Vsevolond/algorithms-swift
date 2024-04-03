import Foundation

let array: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

let a: Int = array[0]
let b: Int = array[1]
let c: Int = array[2]

if (a + b == c) || (a + c == b) || (b + c == a) {
    print("YES")
} else {
    print("NO")
}
