//
//  main.swift
//  sales
//
//  Created by Всеволод on 18.05.2023.
//

import Foundation

let fileName = "/Users/vsevolond/Algorithms_DataStructures_Swift/Algorithms&DataStructures/Dict/sales/input.txt"

func readFromFile() -> [String] {
    guard let text = try? String(contentsOfFile: fileName) else {
        return []
    }
    let split = text.split(separator: "\n").map { String($0) }
    
    return split
}

func lbinsearch(left: Int, right: Int, check: (Int) -> Bool) -> Int {
    var l = left, r = right
    
    while l < r {
        let m = (l + r) / 2
        if check(m) {
            r = m
        } else {
            l = m + 1
        }
    }
    
    return l
}

struct SortedArray<Element: Comparable> {
    
    var items: [Element] = []
    
    mutating func append(_ item: Element) {
        let index = lbinsearch(left: 0, right: items.count) { mid in
            return items[mid] > item
        }
        
        items.insert(item, at: index)
    }
}

struct Products {
    
    var items = SortedArray<String>()
    var countOfItem = [String: Int]()
    
    init(firstProduct: String, count: Int) {
        addProduct(name: firstProduct, count: count)
    }
    
    mutating func addProduct(name: String, count: Int) {
        if let existCount = countOfItem[name] {
            countOfItem.updateValue(existCount + count, forKey: name)
        } else {
            items.append(name)
            countOfItem[name] = count
        }
    }
    
    func getCountOfProduct(by name: String) -> Int {
        return countOfItem[name]!
    }
}

struct Sales {
    
    var users = SortedArray<String>()
    var userProducts = [String: Products]()
    
    mutating func addSale(user: String, product: String, count: Int) {
        if userProducts[user] != nil {
            userProducts[user]!.addProduct(name: product, count: count)
        } else {
            users.append(user)
            userProducts[user] = Products(firstProduct: product, count: count)
        }
    }
    
    func printProducts(for user: String) {
        let products = userProducts[user]!
        for name in products.items.items {
            let count = products.getCountOfProduct(by: name)
            print(name, count, separator: " ", terminator: "\n")
        }
    }
    
    func printSales() {
        for user in users.items {
            print(user, terminator: ":\n")
            printProducts(for: user)
        }
    }
}

let input = readFromFile()
var sales = Sales()

for str in input {
    let data = str.split(separator: " ").map { String($0) }
    let user = data[0]
    let product = data[1]
    let count = Int(data[2])!
    
    sales.addSale(user: user, product: product, count: count)
}

sales.printSales()
