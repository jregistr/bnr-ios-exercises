//
//  ViewController.swift
//  QuizMe
//
//  Created by Registre, Jeff on 2/12/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    let questions = [
        "What happenes when an unstopable force meets an immovable object?",
        "Which came first, the chicken or the egg?"
    ]
    
    let answers = [
        "A vacuum consumes the universe.",
        "The egg, duuuuh!"
    ]

    var qIndex = 0
    
    @IBOutlet
    var questionLabel: UILabel! = nil
    
    @IBOutlet
    var answerLabel: UILabel! = nil
    
    @IBOutlet
    var showAnswerButton: UIButton! = nil
    
    @IBOutlet
    var nextQuestionButton: UIButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[qIndex]
        showAnswerButton.isEnabled = true
        // Do any additional setup after loading the view.
        
    }

    @IBAction
    func showNextQuestion(_ sender: UIButton) {
        incQindex()

        questionLabel.text = questions[qIndex]
        answerLabel.text = "????"
        showAnswerButton.isEnabled = true
    }
    
    @IBAction
    func showAnswer(_ sender: UIButton) {
        showAnswerButton.isEnabled = false
        answerLabel.text = answers[qIndex]
    }

    func incQindex() {
        let nextIndex = qIndex + 1
        guard nextIndex < questions.count else {
            return
        }
        qIndex = nextIndex
    }

}

