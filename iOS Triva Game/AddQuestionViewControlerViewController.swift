//
//  AddQuestionViewControlerViewController.swift
//  iOS Triva Game
//
//  Created by Christian Lamb on 10/19/18.
//  Copyright © 2018 Christian Lamb. All rights reserved.
//

import UIKit

class AddQuestionViewControlerViewController: UIViewController {
    
    @IBOutlet weak var Question: UITextField!
    
    
    @IBOutlet weak var CorrectAnswerSlector: UISegmentedControl!
    @IBOutlet weak var AnswerBTextField: UITextField!
    @IBOutlet weak var AnswerATextField: UITextField!
    
    @IBOutlet weak var AnswerCTextField: UITextField!
    
    @IBOutlet weak var AnswerDTextField: UITextField!
    
    
    var newTriva :TrivaQuestion?
    
    
    @IBAction func CancelButtonTaped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindSegueToQuizScreen", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    
  
    
    @IBAction func AddButtonTaped(_ sender: Any) {
        guard
            let question = Question.text, !question.isEmpty,
            let a = AnswerATextField.text, !a.isEmpty,
            let b = AnswerBTextField.text, !b.isEmpty,
            let c = AnswerCTextField.text, !c.isEmpty,
            let d = AnswerDTextField.text, !d.isEmpty
            else {
                let errorAlert = UIAlertController(title: "Error", message: "Please fill in all feilds, or press cancel to return to the Quiz.", preferredStyle: UIAlertController.Style.alert)
                let dismissAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in}
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil)
                return
        }
        
        newTriva = TrivaQuestion(
            question: NSMetadataUbiquitousItemPercentDownloadedKey, answers: [a,b,c,d], correctAnswerIndex: CorrectAnswerSlector.selectedSegmentIndex)
           performSegue(withIdentifier: "unwindSegueToQuizScreen", sender:self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
        let destinationVC = segue.destination as? GameViewController,
        let newTrivaQuestion = newTriva
            else {return}
        destinationVC.questions.append(newTrivaQuestion)
        destinationVC.resetGame()
    }
    
}
