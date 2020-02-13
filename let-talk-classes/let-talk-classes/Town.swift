//
// Created by Registre, Jeff on 2/11/20.
// Copyright (c) 2020 jregistr. All rights reserved.
//

import Foundation

struct Town {
    static let region = "South"
    var population = 5_422 {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
}