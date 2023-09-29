//
//  main.swift
//  leafOutput
//
//  Created by Всеволод Донченко on 29.09.2023.
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
    
    func printLeaf(from root: Node? = nil) {
        guard let node = root ?? self.root else {
            return
        }
        
        if node.left == nil && node.right == nil {
            print(node.value)
        } else {
            if node.left != nil {
                printLeaf(from: node.left)
            }
            if node.right != nil {
                printLeaf(from: node.right)
            }
        }
    }
}

var array = readLine()!.split(separator: " ").map { Int($0)! }
array.removeLast()

let tree = Tree()

array.forEach { x in
    tree.add(number: x)
}

tree.printLeaf()

