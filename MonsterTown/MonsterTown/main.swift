//
//  main.swift
//  MonsterTown
//
//  Created by Registre, Jeff on 2/11/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import Foundation

print("Hello, World!")

var myTown = Town(name: "PalletTown", population: 21_421, numberOfStoplights: 70)

print(myTown.description)
myTown.changePopBy(1235)
print(myTown.description)

var piranhaBear = Monster()
piranhaBear.name = "Piranha Bear"
piranhaBear.terrorizeTown()

print("\(piranhaBear.name) is on his way to \(myTown.name). ROOOOOOAR.")

piranhaBear.town = myTown

piranhaBear.terrorizeTown()


let rectangle = Rectangle(length: 10, width: 55)

