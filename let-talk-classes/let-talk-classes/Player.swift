//
// Created by Registre, Jeff on 2/11/20.
// Copyright (c) 2020 jregistr. All rights reserved.
//

import Foundation

class Player {
    let name: String
    let isPro: Bool

    init(playerName: String, isProfessional: Bool) {
        name = playerName
        isPro = isProfessional
    }

    convenience init (playerName: String) {
        self.init(playerName: playerName, isProfessional: false)
    }
}