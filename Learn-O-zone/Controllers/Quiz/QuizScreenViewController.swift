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
    var questionCount: Int = 1
    var maxQuestionsCount: Int = 5
    
    var myTimer:Timer?
    var seconds = Int()
    var curentScore: Int = 0

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    
    @IBOutlet weak var questionNumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickQuestion()
        
    }
    
 
    func pickQuestion() {
        
        if questionCount > maxQuestionsCount {
            performSegue(withIdentifier: "outcomeSegue", sender: self)
        } else {
            questionNumLabel.text = "Question \(questionCount)/\(maxQuestionsCount)"
            
            seconds = 60
            myTimer?.invalidate()
            myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            //RunLoop.current.add(myTimer!, forMode: RunLoop.Mode.common)
            
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
            questionCount += 1
        }
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        myTimer?.invalidate()
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
    
        
    @IBAction func btnOne(_ sender: Any) {
        if answerNumber == 0 {
            resultAlert(title: "Correct Answer", message: answerReason)
            pickQuestion()
        } else {
             resultAlert(title: "Incorrect Answer", message: correctAnswer)
        }
        
    }
    
    @IBAction func btnTwo(_ sender: Any) {
        if answerNumber == 1 {
            resultAlert(title: "Correct Answer", message: answerReason)
            pickQuestion()
        } else {
            resultAlert(title: "Incorrect Answer", message: "\(correctAnswer)" )
        }
    }
    
    @IBAction func btnThree(_ sender: Any) {
        if answerNumber == 2 {
            resultAlert(title: "Correct Answer", message: answerReason)
            pickQuestion()
        } else {
            resultAlert(title: "Incorrect Answer", message: correctAnswer)
        }
        
    }
    
    @IBAction func btnFour(_ sender: Any) {
        if answerNumber == 3 {
            resultAlert(title: "Correct Answer", message: answerReason)
            pickQuestion()
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
        
        if seconds == -1 {
            myTimer?.invalidate()
            //seconds = 15
            pickQuestion()
        }
     }

}
