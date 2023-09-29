//
//  main.swift
//  bankAccounts
//
//  Created by Всеволод on 18.05.2023.
//

import Foundation

let fileName = "/Users/vsevolod/Documents/IOS/IOS_projects/Algorithms&DataStructures/Dict/bankAccounts/input.txt"

func readFromFile() -> [String] {
    guard let text = try? String(contentsOfFile: fileName) else {
        return []
    }
    let split = text.split(separator: "\n").map { String($0) }
    
    return split
}

enum Function: String {
    case DEPOSIT
    case WITHDRAW
    case BALANCE
    case TRANSFER
    case INCOME
}

let input = readFromFile()
var bank = [String: Int]()

for str in input {
    let data = str.split(separator: " ").map { String($0) }
    
    guard let function = Function(rawValue: data[0]) else {
        continue
    }
    
    switch function {
    case .DEPOSIT:
        let name = data[1]
        let sum = Int(data[2])!
        if bank[name] == nil {
            bank[name] = sum
        } else {
            bank[name]! += sum
        }
        
    case .WITHDRAW:
        let name = data[1]
        let sum = Int(data[2])!
        if bank[name] == nil {
            bank[name] = -sum
        } else {
            bank[name]! -= sum
        }
        
    case .BALANCE:
        let name = data[1]
        if bank[name] == nil {
            print("ERROR")
        } else {
            print(bank[name]!)
        }
        
    case .TRANSFER:
        let name1 = data[1]
        let name2 = data[2]
        let sum = Int(data[3])!
        
        if bank[name1] == nil {
            bank[name1] = -sum
        } else {
            bank[name1]! -= sum
        }
        
        if bank[name2] == nil {
            bank[name2] = sum
        } else {
            bank[name2]! += sum
        }
        
    case .INCOME:
        let p = Int(data[1])!
        let koef: Double = Double(p) / 100
        for name in bank.keys {
            if bank[name]! > 0 {
                bank[name] = bank[name]! + Int(Double(bank[name]!) * koef)
            }
        }
    }
}
