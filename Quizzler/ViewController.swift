//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var currentQuestions: Question!
    var questionIndex: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestionText()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        let currentView: UIView = view
        progressLabel.text = "\(questionIndex + 1) / \(allQuestions.list.count)"
        scoreLabel.text = "Score: \(score)"
        progressBar.frame.size.width = (currentView.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionIndex + 1)
    }
    

    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex <= allQuestions.list.count - 1 {
            setQuestionText()
            updateUI()
        } else {
            alerting()
        }
    }
    
    
    func checkAnswer() {
        if currentQuestions.answer == pickedAnswer {
            score += 1
            ProgressHUD.showSuccess("Correct!!!")
            nextQuestion()
        } else {
            ProgressHUD.showError("Meeeeee!!")
            if score > 0 {
                score -= 1
            }else{
                score = 0
            }
            nextQuestion()
        }
    }
    
    
    func startOver() {
        questionIndex = 0
        score = 0
        setQuestionText()
        updateUI()
    }
    
    func alerting(){
        let alert = UIAlertController(title: "Awersome", message: "You finish all the questions! You've got \(score-1) point(s). Do you want start over?", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Restart", style: .default) {(UIAlertAction) in
            self.startOver()
        }
        
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func setQuestionText(){
        currentQuestions = allQuestions.list[questionIndex]
        questionLabel.text = currentQuestions.questionText
    }
}
