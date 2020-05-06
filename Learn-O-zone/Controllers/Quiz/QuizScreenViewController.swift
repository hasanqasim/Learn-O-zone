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
    //var timer:Timer?
    var seconds = 10

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickQuestion()
        // Do any additional setup after loading the view.
        //updateTimeLabel()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if seconds >= 0 {
            //print("\(counter) seconds to the end of the world")
            timerLabel.text = "\(seconds)"
            seconds -= 1
        }
    }
    
    /*
    func updateTimeLabel() {
        let sec = seconds % 60
        timerLabel.text = String(format: "%02d", sec)
    }
     */
    
    func pickQuestion() {
        quizQuestionsArray.shuffle()
        if (quizQuestionsArray.count > 0) {
            questionNumber = 0
            questionTextView.text = quizQuestionsArray[questionNumber].question
            //answerNumber = shuffleAnswers(questionNumber)
            for i in 0..<buttons.count {
                let answer = quizQuestionsArray[questionNumber].answers[i]
                buttons[i].setTitle(answer, for: .normal)
            }
            quizQuestionsArray.remove(at: questionNumber)
        }
    }
    
    func shuffleAnswers(_ qNumber: Int) -> Int {
        var answers = quizQuestionsArray[qNumber].answers
        let answer = answers[0]
        correctAnswer = answer
        answers = answers.shuffled()
        let aNumber = answers.firstIndex(of: answer)!
        return aNumber
    }
    
    @IBAction func nextQuestionTapped(_ sender: Any) {
        pickQuestion()
        seconds = 10
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @IBAction func btnOne(_ sender: Any) {
        if answerNumber == 0 {
            resultAlert(title: "Correct Answer", message: quizQuestionsArray[questionNumber].reason)
        } else {
             resultAlert(title: "Incorrect Answer", message: correctAnswer)
        }
        
    }
    
    @IBAction func btnTwo(_ sender: Any) {
        if answerNumber == 1 {
            resultAlert(title: "Correct Answer", message: quizQuestionsArray[questionNumber].reason)
        } else {
            resultAlert(title: "Incorrect Answer", message: correctAnswer)
        }
    }
    
    @IBAction func btnThree(_ sender: Any) {
        if answerNumber == 2 {
            resultAlert(title: "Correct Answer", message: quizQuestionsArray[questionNumber].reason)
        } else {
            resultAlert(title: "Incorrect Answer", message: correctAnswer)
        }
        
    }
    
    @IBAction func btnFour(_ sender: Any) {
        if answerNumber == 3 {
            resultAlert(title: "Correct Answer", message: quizQuestionsArray[questionNumber].reason)
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

}
