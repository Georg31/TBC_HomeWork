import UIKit

// PRIME NUMBERS
func IsSimple(_ num: Int) -> Bool {
if num == 2 || num == 3{return true}
if num == 0 || num == 1{return false}
let root = Int(sqrt(Double(num)))
for i in 2...root{
    if num % i == 0{return false}
}
return true
}

print(IsSimple(1111))

// ARRAY SECOND MIN AND MAX
var array = (1...15).map( {_ in Int.random(in: -10...10)})

func SecMin(array: [Int]) -> (Int)?{
    if array.isEmpty{return nil}
    var min1 = array.first!
    var min2 = min1
    for el in array{
        if min1 > el{
            min2 = min1
            min1 = el
        }
        else if min2 > el && min1 != el{
            min2 = el
        }
    }
    return min2
}

func SecMax(array: [Int]) -> (Int)?{
    if array.isEmpty{return nil}
    var max1 = array.first!
    var max2 = max1
    for el in array{
        if max1 < el{
            max2 = max1
            max1 = el
        }
        else if max2 < el && max1 != el{
            max2 = el
        }
    }
    return max2
}

var max = SecMax(array: array)!
var min = SecMin(array: array)!
print(array)
print(max)
print(min)

// Array Mode

func counter(array: [Int], first: Int) ->(Int){
     var count = 0
    for i in array{
        if first == i {count += 1}
    }
    return count
}

func moda(array: [Int]) -> ([Int], Int)?{
    if array.isEmpty{return nil}
    var count = 2
    var dict = [Int : Int]()
    var mode = [Int]()
    for i in array{
        let co = counter(array: array, first: i)
        if co >= count {
            count = co
            dict[i] = count
        }
    }
        for (key, value) in dict{
            if count == value{mode.append(key)}
        }
    return (mode, count)
}

var mode = moda(array: array)!
print(mode)


// Array Median

func median(array: [Int]) ->(Float)?{
    if array.isEmpty{return nil}
    var arr = array
    arr.sort()
    if arr.count % 2 == 0{
        return Float(arr[arr.count / 2 - 1] + arr[arr.count / 2]) / 2
    }
    return Float(arr[arr.count / 2])
}
 
var med = median(array: array)!
print(array)
print(med)

// Array USJ
var arr = (1...15).map( {_ in Int.random(in: 1...30)})
print(arr)


func USJ(array: [Int]) -> Int?{
    if array.isEmpty{return nil}
    let max = array.max()! / 2
    var arr = array
    var result = 1
    var divider = 2
    while divider <= max{
        var index = [Int]()
        for i in 0..<array.count{
            if arr[i] % divider == 0{index.append(i)}
        }
        if index.count >= 2 {
            for i in index{
                arr[i] = arr[i] / divider
            }
            result *= divider
        }
        else{
            divider += 1
        }
    }
    for i in 0..<arr.count{
        result *= arr[i]
    }
    return result
}


var s = USJ(array: arr)!
print(s)


// Array USG
func gcd(_ a: Int, _ b: Int) -> Int{
    var temp = Int()
    var a = a
    var b = b
    while(b > 0) {
        temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}


func USG(array: [Int]) -> Int?{
    if array.isEmpty{return nil}
    let arr = array
    var result = arr.first!
    for i in 1..<arr.count{
        result = gcd(result, arr[i])
    }
    return result
}

var a = USG(array: arr)!
print(a)

// Array qvesimravle

func qves(array: [Int]) -> [Int]{
    var sum = 0
    var mean = 0
    var Qarr = [Int]()
    for i in array{
        sum += i
    }
    mean = sum / array.count
    
    for i in array{
        if i < mean{ Qarr.append(i)}
    }
    return Qarr
}
var sim = qves(array: arr)
print(sim)



