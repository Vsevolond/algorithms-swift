//
//  main.swift
//  avlBalance
//
//  Created by Всеволод on 03.06.2023.
//

import Foundation

class Node {
    var value: Int
    var parent: Node?
    var left: Node?
    var right: Node?
    
    init(value: Int, parent: Node? = nil, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.parent = parent
        self.left = left
        self.right = right
    }
}

class Tree {
    var root: Node?
    
    func add(number: Int) {
        let newNode = Node(value: number)
        
        guard root != nil else {
            root = newNode
            return
        }
        
        add(in: root, newNode: newNode)
    }
    
    private func add(in currNode: Node?, newNode: Node) {
        guard let value = currNode?.value else {
            return
        }
        
        if newNode.value < value {
            if currNode?.left == nil {
                newNode.parent = currNode
                currNode?.left = newNode
            } else {
                add(in: currNode?.left, newNode: newNode)
            }
        } else if newNode.value > value {
            if currNode?.right == nil {
                newNode.parent = currNode
                currNode?.right = newNode
            } else {
                add(in: currNode?.right, newNode: newNode)
            }
        } else {
            return
        }
    }
    
    func isAvlBalance() -> Bool {
        guard let root else {
            return true
        }
        
        return isAvlBalance(for: root)
    }
    
    private func isAvlBalance(for root: Node? = nil, depth: Int = 1) -> Bool {
        guard let node = root else {
            return true
        }
        
        if abs(height(of: node.left, depth: depth + 1) - height(of: node.right, depth: depth + 1)) <= 1 {
            return isAvlBalance(for: node.left, depth: depth + 1) && isAvlBalance(for: node.right, depth: depth + 1)
        } else {
            return false
        }
    }
    
    private func height(of root: Node? = nil, depth: Int = 1) -> Int {
        guard let node = root else {
            return depth - 1
        }
        
        if node.left != nil && node.right != nil {
            return max(height(of: node.left, depth: depth + 1), height(of: node.right, depth: depth + 1))
        } else if node.left != nil {
            return height(of: node.left, depth: depth + 1)
        } else if node.right != nil {
            return height(of: node.right, depth: depth + 1)
        } else {
            return depth
        }
    }
}

var array = readLine()!.split(separator: " ").map { Int($0)! }
array.removeLast()

let tree = Tree()

array.forEach { x in
    tree.add(number: x)
}

if tree.isAvlBalance() {
    print("YES")
} else {
    print("NO")
}

