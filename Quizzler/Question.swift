//
//  Question.swift
//  Quizzler
//
//  Created by Egor Miasnikov on 9/28/18.
//  Copyright © 2018 egormiasnikov.com. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
