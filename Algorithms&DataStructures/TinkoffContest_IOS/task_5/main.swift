import Foundation

enum FieldValue {
    
    case grass
    case thornyBush
    case mushrooms
}

func maxOfMushrooms(of field: [[FieldValue]], start: (x: Int, y: Int)) -> Int {
    let value = field[start.x][start.y]
    let count = (value == .mushrooms ? 1 : 0)
    
    switch value {
        
    case .thornyBush: return 0
        
    case .grass, .mushrooms:
        if start.x < field.count - 1 {
            if start.y == 0 {
                return count + max(
                    maxOfMushrooms(of: field, start: (start.x + 1, start.y)),
                    maxOfMushrooms(of: field, start: (start.x + 1, start.y + 1))
                )
            } else if start.y == 1 {
                return count + max(
                    maxOfMushrooms(of: field, start: (start.x + 1, start.y)),
                    max(
                        maxOfMushrooms(of: field, start: (start.x + 1, start.y + 1)),
                        maxOfMushrooms(of: field, start: (start.x + 1, start.y - 1))
                    )
                )
            } else {
                return count + max(
                    maxOfMushrooms(of: field, start: (start.x + 1, start.y)),
                    maxOfMushrooms(of: field, start: (start.x + 1, start.y - 1))
                )
            }
        } else { return count }
    }
}

let n = Int(readLine()!)!

var field: [[FieldValue]] = []

for _ in 1...n {
    
    let row: [FieldValue] = readLine()!.split(separator: "").map { char in
        if char == "W" { return .thornyBush }
        else if char == "C" { return .mushrooms }
        else { return .grass }
    }
    
    field.append(row)
}

let maxMushrooms = max(
    maxOfMushrooms(of: field, start: (0, 0)),
    max(
        maxOfMushrooms(of: field, start: (0, 1)),
        maxOfMushrooms(of: field, start: (0, 2))
    )
)

print(maxMushrooms)
