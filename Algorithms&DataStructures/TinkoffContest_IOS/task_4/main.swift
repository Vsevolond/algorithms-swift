import Foundation

enum Direction {
    
    case clockwise
    case anticlockwise
}

let input = readLine()!.split(separator: " ").map { String($0) }
let n: Int = Int(input[0])!

let direction: Direction = input[1] == "L" ? .anticlockwise : .clockwise

var matrix: [[UInt64]] = []

for _ in 1...n {
    let row = readLine()!.split(separator: " ").map { UInt64($0)! }
    matrix.append(row)
}

var operations: [(x1: Int, y1: Int, x2: Int, y2: Int)] = []

var i: Int = 0
var j: Int = n - 1

while i < j {
    for offset in stride(from: i, through: j - 1, by: 1) {
        var values: [(x: Int, y: Int, value: UInt64)] = [
            (i, offset, matrix[i][offset]),
            (i + offset, j, matrix[i + offset][j]),
            (j, n - offset - 1, matrix[j][n - offset - 1]),
            (n - offset - 1, i, matrix[n - offset - 1][i])
        ]
        let rotated: [(x: Int, y: Int, value: UInt64)]
        
        switch direction {
            
        case .clockwise:
            rotated = [values[3], values[0], values[1], values[2]]
            
        case .anticlockwise:
            rotated = [values[1], values[2], values[3], values[0]]
        }
        
        for k in 0...2 {
            if values[k].value != rotated[k].value {
                for p in stride(from: k + 1, through: 3, by: 1) {
                    if values[p].value == rotated[k].value {
                        operations.append((values[p].x, values[p].y, values[k].x, values[k].y))
                        
                        let temp = values[k].value
                        values[k].value = values[p].value
                        values[p].value = temp
                        
                        break
                    }
                }
            }
        }
    }
    
    i += 1
    j -= 1
}

print(operations.count)
for operation in operations {
    print(operation.x1, operation.y1, operation.x2, operation.y2)
}
