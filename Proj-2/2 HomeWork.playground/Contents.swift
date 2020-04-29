import UIKit
 
var array = (1...15).map( {_ in Int.random(in: 1...10)})
var array2 = (1...15).map( {_ in Int.random(in: 5...15)})
print(array)
print(array2)

// Different Elements #1 varianti
func diff(array: [Int]) -> [Int]{
    let arr = array
    var result = [Int]()
    for i in arr{
        let temp = i
        var count = 0
        for a in arr {
            if temp == a{count += 1}
        }
        if count < 2 { result.append(temp)}
    }
    return result
}

var s = diff(array: array)
print(s)

// Different Elements #2 varianti

func diff2(array: [Int]) -> [Int]{
    var set = Set<Int>(array)
    for i in set{
        var count = 0
        for a in array{
            if i == a {count += 1}
        }
        if count > 1 {set.remove(i)}
    }
    let result = [Int](set)
    return result
}

var a = diff2(array: array)
print(a)

// Tanakveta

func Tanak(arr1: [Int], arr2: [Int]) -> [Int]{
    var result = [Int]()
    for i in arr1{
        if arr2.contains(i) {
            result.append(i)
        }
    }
    return result
}

var b = Tanak(arr1: array, arr2: array2)
print(b)


// Gaertianeba

func U(arr1: [Int], arr2: [Int]) -> [Int]{
    let set = Set<Int>(arr1 + arr2)
    var result = [Int](set)
    result.sort()
    return result
}

var u = U(arr1: array, arr2: array2)
print(u)
