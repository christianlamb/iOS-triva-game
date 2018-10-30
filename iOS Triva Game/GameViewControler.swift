//
//  ViewController.swift
//  iOS Triva Game
//
//  Created by Christian Lamb on 10/18/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var piontsLabel: UILabel!
    @IBAction func unwindSegueToQuizScreen(Segue: UIStoryboardSegue ) {}
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
  
    @IBOutlet weak var AnswerA: UIButton!
    
    @IBOutlet weak var AnswerB: UIButton!
    
    @IBOutlet weak var AnswerC: UIButton!
    
    @IBOutlet weak var AnswerD: UIButton!
    
    
    @IBAction func answerTaped(_ sender: UIButton) {
        
        if currentQuestion.correctAnswerIndex == sender.tag {
            score += 1
            showCorrectAnswerAlert()
            
        } else {
            showIncorrectAnswerAlert()
        }
        getNewQuestion()
    }
    
    var questionsPlaceHolder = [TrivaQuestion]()
    func showCorrectAnswerAlert() {
        let correctAlert = UIAlertController(title: "Correct", message: "That is the correct answer.Good Job!!!", preferredStyle: .actionSheet)
        let okayAction = UIAlertAction(title: "Thank You",style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.questionsPlaceHolder.append(self.questions[self.currentIndex])
        
          self.questions.remove(at:self.currentIndex) 
            
        }
        correctAlert.addAction(okayAction)
         self.present(correctAlert, animated: true, completion: nil)
        self.getNewQuestion()
    }
    
    @IBAction func resetGame(_ sender: Any) {
        score = 0
        getNewQuestion()
        populateQuestion()
        
        
    }
    
    
    
    func  showIncorrectAnswerAlert() {
        var questionsPlaceHolder = [TrivaQuestion]()
        
            let incorrectAlert = UIAlertController(title: "InCorrect", message: "That is the Incorrect answer.Good Job!!!", preferredStyle: .actionSheet)
            let okayAction = UIAlertAction(title: "Thank You",style: UIAlertAction.Style.default) {
                UIAlertAction in
                if self.questions.count > 0 { self.questionsPlaceHolder.append(self.questions[self.currentIndex])
                    self.questions.remove(at:self.currentIndex)}
                
            }
            incorrectAlert.addAction(okayAction)
             self.present(incorrectAlert, animated: true, completion: nil)
        self.getNewQuestion()
        }

    
    
    func showGameOverAlert() {
        let endAlert = UIAlertController(title: "Triva Results", message: "Game Over! Your score was \(score) out of \(questionsPlaceHolder.count)", preferredStyle: UIAlertController.Style.alert)
        let resetAction = UIAlertAction(title: "Reset", style: UIAlertAction.Style.default) {UIAlertAction in self.resetGame()}
        
        
    }
    
 
    
    
  
    
    var questions = [TrivaQuestion]()
    var score = 0 {
        didSet{
            piontsLabel.text = "\(score)"
        }
    }
    
    var currentIndex: Int!
    
    var currentQuestion: TrivaQuestion! {
        didSet {
            if let currentQuestion = currentQuestion {
                questionLabel.text = currentQuestion.question
                AnswerA.setTitle(currentQuestion.answers[0], for: .normal)
                AnswerB.setTitle(currentQuestion.answers[1], for: .normal)
                AnswerC.setTitle(currentQuestion.answers[2], for: .normal)
                AnswerD.setTitle(currentQuestion.answers[3], for: .normal)
        }
       }
    }
    
    func getNewQuestion() {
        if questions.count > 0 {
            currentIndex = Int.random(in: 0..<questions.count)
            currentQuestion = questions[currentIndex]
        } else {
            //We need a theres no more questions game over thingy
        }
    }
    
    
    
    

    func populateQuestion()  {
        let question1 = TrivaQuestion(question: "How It Do", answers: ["It do", "Do It", "It Dont","It Good"], correctAnswerIndex: 0)
        let question2 = TrivaQuestion(question: "Whats 2 + 2", answers: ["1", "45", "22", "4"], correctAnswerIndex: 3)
        let question3 = TrivaQuestion(question: "What school are you at", answers: ["Glassgow High", "Barren County Middle", "Barren County High", "School for clowns"], correctAnswerIndex: 3)
        let question4 = TrivaQuestion(question: "What Battle ship was the treaty that ened WWII signed on", answers: ["USS.  Main", "USS. Constaution", "HMS. Hood", "USS Missouri"], correctAnswerIndex: 3)
        questions = [question1,question2,question3,question4]
    }
    
    
    func resetGame () {
        score = 0
        getNewQuestion()
        populateQuestion()
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       populateQuestion()
       getNewQuestion()
      
        }
    }



