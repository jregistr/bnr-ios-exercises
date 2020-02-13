import UIKit

var str = "Hello, playground"

struct Body : CustomStringConvertible {
    var height: Float = 0
    var weight: Float = 0
    
    var description: String {
        "Height: \(height), Weight: \(weight)"
    }
    
    mutating func gainWeight(kilos: Float) {
        weight += kilos
    }
    
    static let MaxLevel = 100
}

class Person {
    var body: Body = Body()
}


class Employee : Person {
    var id: Int = 0
    
    func assignId(identifier: Int) {
        id = identifier
    }
}

var noBody = Body()

var largeBody = Body(height: 200, weight: 150)

let smally = Body(height: 140, weight: 100)

