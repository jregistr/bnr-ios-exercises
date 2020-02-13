import UIKit

var str = "Hello, playground"

var arr = ["111", "cool", "Wooow"]
print(arr)

arr.append("This is a value: \(str)")

let immu = [1,2,3,4]
immu.capacity
immu.count


//arr.map((value) -> string in return "value: Sp double \(value)")

arr.map {(value) -> String in
    return "some: \(value)"
}

var maybeNum: Int?
maybeNum = 100
if let maybeNum = maybeNum {
    print(maybeNum)
}
maybeNum = nil


func messageForUser(name: String?, age: Int?) -> String {
    if let name = name, let age = age {
        return "Hey \(name), I am sorry but You Shall Not Pass. Maybe once you've reached the age of \(age + 1000)."
    }
    return "You shall not pass either.";
}

messageForUser(name: "Woah", age: 500)

var nameToAge = ["foo" : 20, "woah" : 50]
nameToAge["bar"] = 40
nameToAge

//if let wrongAge,let updatedAge = nameToAge["foo"] = 25 {
//    print()
//}


func greetingFor(name: String, title: String) {
    guard title != "President" else {
        print("Nopes, leaving")
        return
    }
    print("Hello Mr \(title) \(name)")
}

func doStuffForPlayer(player: String?) {
    guard let player = player else { return  }
    
    print("The best player in the game is: \(player)")
}

12 % 5

func intToStr(_ f: Int) -> String {
    return f.description
}


func mapArray(_ intArray: Array<Int>, transform: (Int) -> String) -> Array<String> {
    var output: Array<String> = []
    for item in intArray {
        let res = transform(item)
        output.append(res)
    }
    return output;
}

func sorted(_ intArray: Array<Int>, sortBy: (Int, Int) -> Bool) -> Array<Int> {
    intArray.sorted(by: sortBy)
}

mapArray([1,2,3,4], transform: intToStr)


func printGreeting() -> () {
    print("Hello, playground.")
}

mapArray([10, 12, 11, 10, 98]) {(intV) -> String in
    // if it's one line, return not needed
    return intV.description
}

print(mapArray([55,66,11,222], transform: {$0.description}))
print(mapArray([0,1,11432,22122], transform: {(v) in return v.description}))

print(sorted([3,25, 10, 11,1,4], sortBy: >))
print(sorted([13,21,1,4, 99, 4444], sortBy: {$0 < $1}))


print(sorted([131,212,1,41, 99, 4444], sortBy: {i, j in return i > j}))
print(sorted([13,21,1,4, 99, 44, 664, 24], sortBy: {i, j in i > j}))


let rounder: (Double) -> String = {(num: Double) -> String in
    return num.description
}

func format(numbers: [Double], using formatter: (Double)->String = {$0.description}) -> [String] {
    var result = [String]()
    for number in numbers {
        let transformed = formatter(number)
        result.append(transformed)
    }
    return result
}

enum Week {
    case sUN
    case mON
    case tUES
}

var day: Week
day = .sUN

enum SomeRes: String {
    case Foo = "d"
}

enum Try {
    case success(Int)
    case failure(String)
    
    func data() -> String {
        switch self {
        case let .success(i):
            return "yur value: \(i)"
        case let .failure(s):
            return s
        }
    }
}

let f = Try.success(10)
print(f.data())


enum Shapes {
    case square(side: Double)
    case rectangle(length: Double, width: Double)
    case circle(radius: Double)
    
//    func area
}

//---------------------------------------------
