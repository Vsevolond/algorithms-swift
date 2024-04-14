import Foundation

enum FieldValue {
    
    case empty
    case start
    case finish
    case horse
    case king
}

protocol Figure {
    
    func possibleMotions(x: Int, y: Int) -> [(x: Int, y: Int)]
}

class Horse: Figure {
    
    func possibleMotions(x: Int, y: Int) -> [(x: Int, y: Int)] {
        return [
            (x + 2, y + 1),
            (x + 2, y - 1),
            (x - 2, y + 1),
            (x - 2, y - 1),
            (x + 1, y + 2),
            (x - 1, y + 2),
            (x + 1, y - 2),
            (x - 1, y - 2)
        ]
    }
}

class King: Figure {
    
    func possibleMotions(x: Int, y: Int) -> [(x: Int, y: Int)] {
        return [
            (x + 1, y),
            (x - 1, y),
            (x + 1, y + 1),
            (x - 1, y + 1),
            (x + 1, y - 1),
            (x - 1, y - 1),
            (x, y + 1),
            (x, y - 1)
        ]
    }
}

func minOfMotions(in field: [[FieldValue]], by figure: Figure, passedPositions: [[Bool]], start: (x: Int, y: Int)) -> Int? {
    let value = field[start.x][start.y]
    let n = field.count
    var newPassed = passedPositions
    newPassed[start.x][start.y] = true
    
    switch value {
        
    case .finish: return 0
        
    case .horse, .king, .empty, .start:
        let newFigure = (value == .horse ? Horse() : (value == .king ? King() : figure))
        
        let points = newFigure.possibleMotions(x: start.x, y: start.y).filter {
            $0.x >= 0 && $0.x < n && $0.y >= 0 && $0.y < n && !passedPositions[$0.x][$0.y]
        }
        
        guard let minMotions = points.compactMap({
            minOfMotions(in: field, by: newFigure, passedPositions: newPassed, start: ($0.x, $0.y))
        }).min() else {
            return nil
        }
        
        return 1 + minMotions
    }
}

let n = Int(readLine()!)!

var field: [[FieldValue]] = []
var start: (x: Int, y: Int) = (0, 0)

for i in 0..<n {
    
    let values: [FieldValue] = readLine()!.split(separator: "").enumerated().map { j, char in
        if char == "S" {
            start = (i, j)
            return .start
            
        } else if char == "F" { return .finish }
        else if char == "K" { return .horse }
        else if char == "G" { return .king }
        else { return .empty }
    }
    
    field.append(values)
}

var passed: [[Bool]] = .init(repeating: .init(repeating: false, count: n), count: n)

guard let minMotions = minOfMotions(in: field, by: Horse(), passedPositions: passed, start: start) else {
    print(-1)
    exit(0)
}

print(minMotions)
