import Foundation

extension Character {
    
    private var vowels: [Character] {
        ["a", "e", "i", "o", "u"]
    }
    
    var isVowel: Bool { vowels.contains(self) }
}

extension String {
    
    var countOfVowels: Int {
        reduce(into: 0) { count, char in
            count += char.isVowel ? 1 : 0
        }
    }
}

func readFromFile(fileName: String) -> [String] {
    guard let text = try? String(contentsOfFile: fileName) else {
        return []
    }
    let split = text.split(separator: "\n").map { String($0) }
    
    return split
}

let fileName = "/Users/vsevolond/algorithms-swift/Algorithms&DataStructures/YandexContest_MobileSchool/labraltar/input.txt"
var words = readFromFile(fileName: fileName)

words.removeFirst()

words.sort { lhs, rhs in
    return (lhs.countOfVowels > rhs.countOfVowels) ||
    (lhs.countOfVowels == rhs.countOfVowels && lhs.count < rhs.count)
}

for word in words {
    print(word)
}
