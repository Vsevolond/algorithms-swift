import Foundation

class Directory: Hashable {
    
    let name: String
    let parent: Directory?
    var subDirectories: Set<Directory> = .init()
    
    var offset: String {
        guard let parent else { return "" }
        return parent.offset + "  "
    }
    
    init(name: String, parent: Directory? = nil) {
        self.name = name
        self.parent = parent
    }
    
    func append(directory name: String) {
        let directory = Directory(name: name, parent: self)
        subDirectories.insert(directory)
    }
    
    func subDirectory(by name: String) -> Directory? {
        if let directory = subDirectories.first(where: { $0.name == name }) {
            return directory
            
        } else {
            let directory = Directory(name: name, parent: self)
            subDirectories.insert(directory)
            return directory
        }
    }
    
    func printTree() {
        print(offset, name, separator: "")
        for directory in subDirectories.sorted(by: { $0.name < $1.name }) {
            directory.printTree()
        }
    }
    
    static func == (lhs: Directory, rhs: Directory) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

let n = Int(readLine()!)!
var root: Directory? = nil

for _ in 1...n {
    
    let directories: [String] = readLine()!.split(separator: "/").map { String($0) }
    if root == nil {
        root = .init(name: directories[0])
    }
    
    guard directories.count > 1 else { continue }
    
    var directoryToAppend = root
    let m = directories.count
    
    for i in 1..<m - 1 {
        directoryToAppend = directoryToAppend?.subDirectory(by: directories[i])
    }
    
    directoryToAppend?.append(directory: directories[m - 1])
}

root?.printTree()
