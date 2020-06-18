//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Vahe Aslanyan on 4/15/20.
//  Copyright © 2020 Vahe Aslanyan. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        //this Question is a custom struct defined in Question.swift
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var questionNumber = 0
    var userScore = 0

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].rightAnswer {
            userScore += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return userScore
    }
    
    func getQuestionText() -> [String: String] {
        let questionText: [String: String] = [
            "q": quiz[questionNumber].text,
            "a": quiz[questionNumber].answers[0],
            "b": quiz[questionNumber].answers[1],
            "c": quiz[questionNumber].answers[2]]
        
        return questionText
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    

    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            userScore = 0
        }
    }
}
