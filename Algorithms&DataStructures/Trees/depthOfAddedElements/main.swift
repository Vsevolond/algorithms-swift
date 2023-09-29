//
//  main.swift
//  depthOfAddedElements
//
//  Created by Всеволод on 02.06.2023.
//


import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

class Tree {
    var root: Node?
    
    func add(number: Int) -> Int {
        let newNode = Node(value: number)
        
        guard root != nil else {
            root = newNode
            return 1
        }
        
        return add(in: root, newNode: newNode, depth: 1)
    }
    
    private func add(in currNode: Node?, newNode: Node, depth: Int) -> Int {
        guard let value = currNode?.value else {
            return -1
        }
        
        if newNode.value < value {
            if currNode?.left == nil {
                currNode?.left = newNode
                return depth + 1
            } else {
                return add(in: currNode?.left, newNode: newNode, depth: depth + 1)
            }
        } else if newNode.value > value {
            if currNode?.right == nil {
                currNode?.right = newNode
                return depth + 1
            } else {
                return add(in: currNode?.right, newNode: newNode, depth: depth + 1)
            }
        } else {
            return -1
        }
    }
}

var array = readLine()!.split(separator: " ").map { Int($0)! }
array.removeLast()

let tree = Tree()

array.forEach { x in
    let result = tree.add(number: x)
    if result != -1 {
        print(result, terminator: " ")
    }
}



