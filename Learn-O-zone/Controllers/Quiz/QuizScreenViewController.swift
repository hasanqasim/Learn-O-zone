//
//  QuizScreenViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 2/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class QuizScreenViewController: UIViewController {
    
    
    var quizQuestionsArray = [Quiz]()
    var questionNumber = Int()
    var answerNumber = Int()
    var correctAnswer = String()
    var answerReason = String()
    //var timer:Timer?
    var seconds = Int()

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickQuestion()
    }
    
 
    
    
    func pickQuestion() {
        seconds = 15
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        quizQuestionsArray = quizQuestionsArray.shuffled()
        if (quizQuestionsArray.count > 0) {
            questionNumber = 0
            questionTextView.text = quizQuestionsArray[questionNumber].question
            var answers = quizQuestionsArray[questionNumber].answers
            correctAnswer = answers[0]
            answers = answers.shuffled()
            answerNumber = answers.firstIndex(of: correctAnswer)!
            for i in 0..<buttons.count {
                let answer = answers[i]
                buttons[i].setTitle(answer, for: .normal)
            }
            answerReason = quizQuestionsArray[questionNumber].reason
            quizQuestionsArray.remove(at: questionNumber)
        }
    }
    
    /*
    func shuffleAnswers(_ qNumber: Int) -> Int {
        var answers = quizQuestionsArray[qNumber].answers
        let answer = answers[0]
        correctAnswer = answer
        answers = answers.shuffled()
        let aNumber = answers.firstIndex(of: answer)!
        return aNumber
    }
   */
    
    
    @IBAction func nextQuestionTapped(_ sender: Any) {
        seconds = 15
        pickQuestion()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func btnOne(_ sender: Any) {
        if answerNumber == 0 {
            resultAlert(title: "Correct Answer", message: answerReason)
        } else {
             resultAlert(title: "Incorrect Answer", message: correctAnswer)
        }
        
    }
    
    @IBAction func btnTwo(_ sender: Any) {
        if answerNumber == 1 {
            resultAlert(title: "Correct Answer", message: answerReason)
        } else {
            resultAlert(title: "Incorrect Answer", message: "\(correctAnswer)" )
        }
    }
    
    @IBAction func btnThree(_ sender: Any) {
        if answerNumber == 2 {
            resultAlert(title: "Correct Answer", message: answerReason)
        } else {
            resultAlert(title: "Incorrect Answer", message: correctAnswer)
        }
        
    }
    
    @IBAction func btnFour(_ sender: Any) {
        if answerNumber == 3 {
            resultAlert(title: "Correct Answer", message: answerReason)
        } else {
            resultAlert(title: "Incorrect Answer", message: correctAnswer)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func resultAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler:nil))
        self.present(alertController, animated:true, completion:nil)
    }
    
    @objc func updateCounter() {
         //example functionality
         if seconds >= 0 {
             timerLabel.text = "\(seconds)"
             seconds -= 1
         }
     }

}
