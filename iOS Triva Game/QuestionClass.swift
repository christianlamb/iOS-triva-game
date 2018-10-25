//
//  QuestionClass.swift
//  iOS Triva Game
//
//  Created by Christian Lamb on 10/19/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import Foundation


class TrivaQuestion {
    let question: String//The Question
    let answers: [String]//All possible amswers
    let correctAnswerIndex: Int//The Int that Corasponds with the correct answer
    var correctAswer: String {
        return answers[correctAnswerIndex]
    }
    //Intializes the varabiles above.
    init(question : String, answers : [String], correctAnswerIndex : Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    
   
  
    
    
}

