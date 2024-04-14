import Foundation

class Matrix {
    
    var rows: [[UInt64]] = []
    
    var size: (n: Int, m: Int) {
        (rows.count, (rows.first ?? []).count)
    }
    
    func append(row: [UInt64]) {
        rows.append(row)
    }
    
    func rotate() {
        var newRows: [[UInt64]] = .init(repeating: .init(repeating: .zero, count: size.n), count: size.m)
        
        for i in 0..<size.n {
            let col = size.n - i - 1
            let row = rows[i]
            
            for j in 0..<size.m {
                newRows[j][col] = rows[i][j]
            }
        }
        
        rows = newRows
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

let matrix: Matrix = .init()

for _ in 1...n {
    let row: [UInt64] = readLine()!.split(separator: " ").map { UInt64($0)! }
    matrix.append(row: row)
}

matrix.rotate()

for row in matrix.rows {
    for elem in row {
        print(elem, terminator: " ")
    }
    
    print()
}
