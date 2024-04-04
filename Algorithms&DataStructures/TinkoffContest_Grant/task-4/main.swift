import Foundation

extension Array where Element == Int {
    
    func appending(_ elem: Int) -> [Int] {
        var newArr = self
        newArr.append(elem)
        return newArr
    }
}

func getArray(by array: [Int], sum: (limit: Int, current: Int)) -> [Int]? {
    guard sum.current <= sum.limit, let lastElem = array.last else {
        return nil
    }
    
    if sum.current == sum.limit {
        return array
        
    } else {
        return getArray(by: array.appending(lastElem + 1), sum: (sum.limit, sum.current + lastElem + 1)) ??
        getArray(by: array.appending(lastElem * 2), sum: (sum.limit, sum.current + lastElem * 2))
    }
}

let n: Int = Int(readLine()!)!

if let array = getArray(by: [1], sum: (n, 1)) {
    for elem in array {
        print(elem, terminator: " ")
    }
    
} else {
    print(-1)
}




