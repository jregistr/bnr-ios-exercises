//
//  Stock.swift
//  WorldTrotter
//
//  Created by Registre, Jeff on 2/13/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import UIKit

class Stock : Codable {
    var name: String
    var abbrv: String
    
    var valueInDollars: Int = 0
    var lastUpdated: Date? = nil
    
    
    init(name: String, abbrv: String, value: Int) {
        self.name = name
        self.abbrv = abbrv
        self.valueInDollars = value
    }
    
    convenience init(name: String, abbrv: String) {
        self.init(name: name, abbrv: abbrv, value: 0)
    }

}

let baseNames = ["Fluffy", "Cookwares", "Micro", "Pear", "Fruity", "Energy", "Pen", "Pens", "Star", "Brook", "Capital", "Gains", "Flower", "Life", "Motors", "Property"]
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

func randName() -> String {
    let count = Int.random(in: 1...4)
    var concat = ""
    for _ in 1...count {
        concat += " \(baseNames.randomElement()!)"
    }
    return concat
}

func randAbbrv() -> String {
    let count = Int.random(in: 1...4)
    var concat = ""
    for _ in 1...count {
        concat += String(alphabet.randomElement()!)
    }
    return concat
}

extension Stock {
    
    convenience init(random: Bool = false) {
        if random {
            let name = randName()
            let abbrv = randAbbrv()
            let value = Int.random(in: 0...5000)
            self.init(name: name, abbrv: abbrv, value: value)
        } else {
            self.init(name: "", abbrv: "", value: 0)
        }
    }
}

extension Stock : Equatable {
    static func ==(lhs: Stock, rhs: Stock) -> Bool {
        lhs.name == rhs.name &&
            lhs.valueInDollars == rhs.valueInDollars
    }
}
