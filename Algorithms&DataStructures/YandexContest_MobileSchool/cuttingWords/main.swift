import Foundation

extension String {
    
    var maxCharValue: Int {
        unicodeScalars.map { Int($0.value) }.max() ?? 0
    }
    
    var minCharValue: Int {
        unicodeScalars.map { Int($0.value) }.min() ?? 0
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let l: Int = input[1]
let r: Int = input[2]

let word: [Character] = readLine()!.split(separator: "").map { $0.first! }

var dp: [Int] = .init(repeating: -1, count: n + 1)
dp[0] = 0
var prev: [Int] = .init(repeating: -1, count: n + 1)

for i in 1...n {
    for j in l...r {
        
        let start: Int = i - j
        guard start >= l || start == 0 else { continue }
        
        let currentWord: String = String(word[start..<i])
        
        let profit: Int = currentWord.maxCharValue - currentWord.minCharValue
        
        if dp[start] + profit > dp[i] {
            dp[i] = dp[start] + profit
            prev[i] = start
        }
    }
}

var slicedWords: [String] = .init()
var current: Int = n

var noSolution: Bool = false

while current != 0, !noSolution {

    if prev[current] < 0 || dp[current] < 0 {
        noSolution = true
        
    } else {
        
        let currentWord: String = String(word[prev[current]..<current])
        slicedWords.insert(currentWord, at: 0)
        current = prev[current]
    }
}

if noSolution {
    print("NO SOLUTION")
    
} else {
    print(dp[n])
    print(slicedWords.count)

    slicedWords.forEach { slicedWord in
        print(slicedWord)
    }
}
