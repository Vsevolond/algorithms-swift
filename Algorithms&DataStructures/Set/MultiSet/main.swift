//
//  main.swift
//  MultiSet
//
//  Created by Всеволод on 09.03.2023.
//

import Foundation

let setSize = 10

var multiSet = Array(repeating: Array<Int>(), count: setSize)

func add(element: Int) {
    multiSet[element % setSize].append(element)
}

func find(element: Int) -> Bool {
    for elem in multiSet[element % setSize] {
        if elem == element {
            return true
        }
    }
    
    return false
}

func delete(element: Int) {
    var elemList = multiSet[element % setSize]
    
    for i in 0..<elemList.count {
        if elemList[i] == element {
//            elemList[i] = elemList.last!
            elemList.swapAt(i, elemList.count - 1)
            elemList.removeLast()
            return
        }
    }
}




