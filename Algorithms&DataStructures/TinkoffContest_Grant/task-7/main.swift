import Foundation

func cost(of array: [Int], in range: ClosedRange<Int>) -> Int {
    var uniqueValues: Set<Int> = .init()
    range.forEach { i in
        uniqueValues.insert(array[i])
    }
    
    return uniqueValues.count * range.count
}

func rbinsearch(left: Int, right: Int, array: [Int], check: (Int) -> Bool) -> Int {
    var l = left, r = right
    while l < r {
        let m = (l + r + 1) / 2
        if check(m) {
            l = m
        } else {
            r = m - 1
        }
    }
    
    return l
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let limit: Int = input[1]
let queriesCount: Int = input[2]

let array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

for _ in 1...queriesCount {
    
    let query: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let left: Int = query[0] - 1
    let right: Int = query[1] - 1
    
    var count: Int = 0
    var start: Int = left
    
    while start <= right {
        start = rbinsearch(left: start, right: right, array: array, check: { end in
            cost(of: array, in: start...end) <= limit
        }) + 1
        
        count += 1
    }
    
    print(count)
}
