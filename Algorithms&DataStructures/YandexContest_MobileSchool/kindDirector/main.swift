import Foundation

enum Direction: String {
    
    case left = "L"
    case right = "R"
    case up = "U"
    case down = "D"
}

struct Coord: Hashable {
    
    var x: Int
    var y: Int
    
    mutating func moveBy(_ direction: Direction) {
        switch direction {
        case .left:
            x -= 1
        case .right:
            x += 1
        case .up:
            y += 1
        case .down:
            y -= 1
        }
    }
}

let directions: [Direction] = readLine()!.split(separator: "").map { Direction(rawValue: String($0))! }

var currentPos: Coord = .init(x: 0, y: 0)
var passedPositions: Set<Coord> = .init()

var passedSeveralTimes: Set<Coord> = .init()

for direction in directions {
    passedPositions.insert(currentPos)
    currentPos.moveBy(direction)
    
    if passedPositions.contains(currentPos) {
        passedSeveralTimes.insert(currentPos)
    }
}

print(passedSeveralTimes.count)
