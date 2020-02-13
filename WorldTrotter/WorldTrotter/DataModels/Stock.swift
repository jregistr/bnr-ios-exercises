//
//  Stock.swift
//  WorldTrotter
//
//  Created by Registre, Jeff on 2/13/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import UIKit

class Stock {
    let name: String
    let abbrv: String
    
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

let baseNames = ["Fluffy", "Cookwares", "Micro", "Pear", "Fruity", "Energy", "Pen", "Pens", "Star", "Brook"]
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let glues = [1, 2, 3]

extension Stock {
    
    func randName() -> String {
        let count = glues.randomElement()!
        var concat = ""
        for _ in 0...count {
            concat += baseNames.randomElement()!
        }
        return concat
    }
    
    
}
