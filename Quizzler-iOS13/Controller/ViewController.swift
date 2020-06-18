//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Vahe Aslanyan on 4/15/20.
//  Copyright © 2020 Vahe Aslanyan. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo:nil, repeats: false )
        
    }
    
    //resets changes before proceeding to next question
    @objc func updateUI() {
        let questionText = quizBrain.getQuestionText()
        questionLabel.text = questionText["q"]
        buttonA.setTitle(questionText["a"], for: .normal)
        buttonB.setTitle(questionText["b"], for: .normal)
        buttonC.setTitle(questionText["c"], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        buttonA.backgroundColor = UIColor.clear
        buttonB.backgroundColor = UIColor.clear
        buttonC.backgroundColor = UIColor.clear

    }
}

