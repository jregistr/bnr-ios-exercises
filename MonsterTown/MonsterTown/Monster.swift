//
//  Monster.swift
//  MonsterTown
//
//  Created by Registre, Jeff on 2/11/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name = "SpiderVelocirator"
    
    func terrorizeTown() {
        guard town != nil else {
            print("\(name) hasn't found a town to terrorize yet...")
            return
        }
        print("\(name) is terrorizing a town! ROOOOOOAR. Bruh, they all ran inside their houses. ROOOOOAR")
    }
}
