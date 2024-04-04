import Foundation

let n: Int = Int(readLine()!)!

var words: [String] = (1...2 * n).map { _ in readLine()! }

var startWith: [Character: [String]] = [:]

for word in words {
    guard let startChar = word.first else {
        continue
    }
    
    if startWith[startChar] != nil {
        startWith[startChar]?.append(word)
        
    } else {
        startWith[startChar] = [word]
    }
}

var currentWord: String = words[0]
print(currentWord)

for _ in 2...2 * n {
    
    guard let endChar = currentWord.last, let nextWord = startWith[endChar]?.removeFirst() else {
        continue
    }
    
    print(nextWord)
    currentWord = nextWord
}
