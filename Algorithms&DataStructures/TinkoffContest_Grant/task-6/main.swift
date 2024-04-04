import Foundation

func gcd(a: Int, b: Int) -> Int {
    guard a != b, b != 0 else { return a }
    guard a != 0 else { return b }
    
    if a % 2 == 0 {
        if b % 2 == 0 {
            return gcd(a: a / 2, b: b / 2) * 2
            
        } else {
            return gcd(a: a / 2, b: b)
        }
    }
    
    if b % 2 == 0 { return gcd(a: a, b: b / 2) }
    
    if a > b {
        return gcd(a: (a - b) / 2, b: b)
        
    } else {
        return gcd(a: (b - a) / 2, b: a)
    }
}

struct Fraq: Comparable {
    
    var numerator: Int
    var denominator: Int
    
    var isInteger: Bool { denominator == 1 }
    
    init(_ numerator: Int, _ denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    private static func reduce(fraq: inout Fraq) {
        let nod = gcd(a: fraq.numerator, b: fraq.denominator)
        fraq.numerator /= nod
        fraq.denominator /= nod
    }
    
    static func < (lhs: Fraq, rhs: Fraq) -> Bool {
        lhs.numerator * rhs.denominator < lhs.denominator * rhs.numerator
    }
    
    static func / (fraq: Fraq, num: Int) -> Fraq {
        var newFraq: Fraq = .init(fraq.numerator, fraq.denominator * num)
        reduce(fraq: &newFraq)
        
        return newFraq
    }
    
    static func + (lhs: Fraq, rhs: Fraq) -> Fraq {
        var newFraq: Fraq = .init(
            lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator,
            lhs.denominator * rhs.denominator
        )
        
        reduce(fraq: &newFraq)
        return newFraq
    }
    
    static func - (lhs: Fraq, rhs: Fraq) -> Fraq {
        var newFraq: Fraq = .init(
            lhs.numerator * rhs.denominator - rhs.numerator * lhs.denominator,
            lhs.denominator * rhs.denominator
        )
        
        reduce(fraq: &newFraq)
        return newFraq
    }
    
    static func += (lhs: inout Fraq, rhs: Fraq) {
        lhs.numerator = lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator
        lhs.denominator *= rhs.denominator
        reduce(fraq: &lhs)
    }
    
    static func -= (lhs: inout Fraq, rhs: Fraq) {
        lhs.numerator = lhs.numerator * rhs.denominator - rhs.numerator * lhs.denominator
        lhs.denominator *= rhs.denominator
        reduce(fraq: &lhs)
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let guestsCount: Int = input[1]

var masses: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

masses.sort()
var sum: Int = masses.reduce(into: 0) { $0 += $1 }
let mid: Fraq = .init(sum, 1) / guestsCount

var orangeMasses: [Fraq] = masses.map { .init($0, 1) }
var guestsMasses: [Fraq] = .init(repeating: .init(0, 1), count: guestsCount)
var cutCount: Int = 0

var orangeIndex: Int = 0
var guestIndex: Int = 0

while orangeIndex < n, guestIndex < guestsCount {
    
    let current: Fraq = guestsMasses[guestIndex] + orangeMasses[orangeIndex]
    if current < mid {
        guestsMasses[guestIndex] += orangeMasses[orangeIndex]
        orangeIndex += 1
        
    } else if current == mid {
        guestsMasses[guestIndex] += orangeMasses[orangeIndex]
        guestIndex += 1
        orangeIndex += 1
        
    } else {
        let diff: Fraq = mid - guestsMasses[guestIndex]
        let orangeOverMid: Int = orangeMasses.lastIndex(where: { $0 - diff >= mid})!
        guestsMasses[guestIndex] += diff
        orangeMasses[orangeOverMid] -= diff
        guestIndex += 1
        cutCount += 1
    }
}

print(cutCount)
