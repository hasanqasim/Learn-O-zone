//
//  QuizScreenViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 2/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import Firebase

class QuizScreenViewController: UIViewController, UITabBarControllerDelegate {
    
    var quizQuestionsArray = [Quiz]()
    var questionNumber = Int()
    var answerNumber = Int()
    var correctAnswer = String()
    var answerReason = String()
    var questionCount: Int = 1
    var maxQuestionsCount: Int = 5
    
    var myTimer:Timer?
    var seconds = Int()
    var currentScore: Int = 0
    var quizOutcomeStatus = true

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    
    @IBOutlet weak var questionNumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickQuestion()
        self.tabBarController?.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationController?.popViewController(animated: true)
    }
    
 
    func pickQuestion() {
        scoreValueLabel.text = "\(currentScore)"
        myTimer?.invalidate()
        if questionCount > maxQuestionsCount {
            CurrentUser.getCurrentUser().setScore(currentScore: currentScore)
            let currentBestScore = CurrentUser.getCurrentUser().bestScore
            if currentBestScore < currentScore {
                CurrentUser.getCurrentUser().setBestScore(currentBestScore: currentScore)
            }
            let db = Firestore.firestore()
            if let userId = Auth.auth().currentUser?.uid {
                db.collection("Users").document(userId).updateData(["score":CurrentUser.getCurrentUser().score, "bestScore":CurrentUser.getCurrentUser().bestScore])
            }
            DispatchQueue.main.asyncAfter(deadline:.now() + 2.0, execute: {
               self.performSegue(withIdentifier:"outcomeSegue",sender: self)
            })
        } else {
            questionNumLabel.text = "Question \(questionCount)/\(maxQuestionsCount)"
            quizOutcomeStatus = true
            seconds = 60
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
            if (quizOutcomeStatus) {
                currentScore += 10
            }
            resultAlert(title: "Correct Answer", message: correctAnswer)
            pickQuestion()
        } else {
            quizOutcomeStatus = false
            resultAlert(title: "Incorrect Answer", message: answerReason)
        }
        
    }
    
    @IBAction func btnTwo(_ sender: Any) {
        if answerNumber == 1 {
            if (quizOutcomeStatus) {
                currentScore += 10
            }
            resultAlert(title: "Correct Answer", message: correctAnswer)
            pickQuestion()
        } else {
            quizOutcomeStatus = false
            resultAlert(title: "Incorrect Answer", message: answerReason )
        }
    }
    
    @IBAction func btnThree(_ sender: Any) {
        if answerNumber == 2 {
            if (quizOutcomeStatus) {
                currentScore += 10
            }
            resultAlert(title: "Correct Answer", message: correctAnswer)
            pickQuestion()
        } else {
            quizOutcomeStatus = false
            resultAlert(title: "Incorrect Answer", message: answerReason)
        }
        
    }
    
    @IBAction func btnFour(_ sender: Any) {
        if answerNumber == 3 {
            if (quizOutcomeStatus) {
                currentScore += 10
            }
            resultAlert(title: "Correct Answer", message: correctAnswer)
            pickQuestion()
        } else {
            quizOutcomeStatus = false
            resultAlert(title: "Incorrect Answer", message: answerReason)
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
