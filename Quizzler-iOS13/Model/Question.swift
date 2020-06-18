//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Vahe Aslanyan on 4/15/20.
//  Copyright © 2020 Vahe Aslanyan. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String

    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
