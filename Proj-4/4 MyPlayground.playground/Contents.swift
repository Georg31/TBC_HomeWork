import UIKit

// #1 String extentions

extension String{
    func vowels() -> Int{
        var Count = 0
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        for ch in self {
          if (vowels.contains(ch)) {
            Count += 1
          }
        }
        return Count
    }
    
    func consonant() -> Int{
        var Count = 0
        let cons: [Character] = ["a", "e", "i", "o", "u"]
        for ch in self {
          if (!cons.contains(ch) && (ch > "a" && ch < "z")) {
            Count += 1
          }
        }
        return Count
    }
    
    func reverse() -> String {
        var result = String()
        for char in self.reversed() {
            result.append(char)
        }
        return result
    }
    
}

var s = "hello world"
s.vowels()
s.consonant()
s.reverse()


// #2

protocol father{
    var value : Int { get set }
    func divide() -> Int
}

class a : father{
    func divide() -> Int {
        return self.value % 10
    }
    var value: Int
    init( _ val : Int) {
        self.value = val
    }
}

class b : father{
    func divide() -> Int {
        return self.value % 10
    }
    var value: Int
    init( _ val : Int) {
        self.value = val
    }
}

class c : father{
    func divide() -> Int {
        return self.value % 10
    }
    var value: Int
    init(_ val : Int) {
        self.value = val
    }
}

var arr : [father] = [a(1),a(2),a(3),b(4),b(5),b(6),c(7),c(8),c(9)]
var sum = 0
for i in arr{
    sum += i.divide()
}
print(sum)

