import Foundation

let n = Int(readLine()!)!
let marks: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

guard n >= 7 else {
    print(-1)
    exit(0)
}

class State {
    
    private var countOfMarks: [Int : Int] = [:]
    
    var isCool: Bool {
        (countOfMarks[2] ?? 0) == 0 && (countOfMarks[3] ?? 0) == 0
    }
    
    var countOfFive: Int { countOfMarks[5] ?? 0 }
    
    func append(mark: Int) {
        if let count = countOfMarks[mark] {
            countOfMarks.updateValue(count + 1, forKey: mark)
            
        } else {
            countOfMarks[mark] = 1
        }
    }
    
    func delete(mark: Int) {
        guard let count = countOfMarks[mark] else {
            return
        }
        
        countOfMarks.updateValue(count - 1, forKey: mark)
    }
}

let state: State = .init()

for i in 0...6 {
    state.append(mark: marks[i])
}

var i: Int = 0
var j: Int = 7

var max: Int = state.countOfFive
var isCool = state.isCool

while j < n {
    state.delete(mark: marks[i])
    state.append(mark: marks[j])
    
    if state.isCool && (!isCool || state.countOfFive > max) {
        max = state.countOfFive
        isCool = state.isCool
    }
    
    i += 1
    j += 1
}

if isCool {
    print(max)
    
} else {
    print(-1)
}
