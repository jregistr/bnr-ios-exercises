//
//  Town.swift
//  MonsterTown
//
//  Created by Registre, Jeff on 2/11/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import Foundation

struct Town : CustomStringConvertible {
    var name: String
    var population = 71_124
    var numberOfStoplights = 50
    
    var description: String {
        return "\(name) has a population of \(population) with \(numberOfStoplights) stoplights"
    }
    
    mutating func changePopBy(_ amount: Int) {
        population += amount
    }
}
