//
//  main.swift
//  numberOfChildren
//
//  Created by Всеволод on 03.06.2023.
//

import Foundation

class Node {
    var value: String
    var left: Node?
    var right: Node?
    
    init(value: String, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

class Tree {
    var root: Node?
    var parentOfChild: [String: String] = [:]
    var countOfChildren: [String: Int] = [:]
    
    func add(child: String, parent: String) {
        let childNode = Node(value: child)
        let parentNode = Node(value: parent)
        
        parentOfChild[child] = parent
        increaseCountOfChildren(for: parent, child: child)
        
        guard root != nil else {
            root = parentNode
            add(in: root, newNode: childNode)
            return
        }
        
        add(in: root, newNode: parentNode)
        add(in: root, newNode: childNode)
    }
    
    private func increaseCountOfChildren(for parent: String, child: String) {
        if let childsChildren = countOfChildren[child] {
            increaseCountOfChildren(for: parent, count: childsChildren + 1)
        } else {
            countOfChildren[child] = 0
            increaseCountOfChildren(for: parent, count: 1)
        }
    }
    
    private func increaseCountOfChildren(for parent: String, count: Int) {
        if countOfChildren[parent] != nil {
            countOfChildren[parent]! += count
        } else {
            countOfChildren[parent] = count
        }
        
        if let grandParent = parentOfChild[parent] {
            increaseCountOfChildren(for: grandParent, count: count)
        }
    }
    
    private func add(in currNode: Node?, newNode: Node) {
        guard let value = currNode?.value else {
            return
        }
        
        if newNode.value < value {
            if currNode?.left == nil {
                currNode?.left = newNode
            } else {
                add(in: currNode?.left, newNode: newNode)
            }
        } else if newNode.value > value {
            if currNode?.right == nil {
                currNode?.right = newNode
            } else {
                add(in: currNode?.right, newNode: newNode)
            }
        } else {
            return
        }
    }
    
    func printCountOfChildren(from root: Node? = nil) {
        guard let node = root ?? self.root else {
            return
        }
        
        if node.left != nil {
            printCountOfChildren(from: node.left)
        }
        
        print(node.value, countOfChildren[node.value] ?? 0, separator: " ")

        if node.right != nil {
            printCountOfChildren(from: node.right)
        }
    }
}

let tree = Tree()

let n = Int(readLine()!)!
(1..<n).forEach { _ in
    let input = readLine()!.split(separator: " ").map { String($0) }
    tree.add(child: input[0], parent: input[1])
}

tree.printCountOfChildren()
