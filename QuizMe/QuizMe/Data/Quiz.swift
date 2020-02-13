//
//  QuizItem.swift
//  QuizMe
//
//  Created by Registre, Jeff on 2/12/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import Foundation

struct Challenge {
    let question: String
    let answer: String
}

extension Challenge : CustomStringConvertible {
    
    var description: String {
        "Question: \(question)\nAnswer: \(answer)"
    }
}


class Quiz {
    
}
