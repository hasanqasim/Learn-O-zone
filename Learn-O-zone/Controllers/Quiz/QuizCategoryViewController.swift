//
//  QuizCategoryViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 20/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import Firebase

class QuizCategoryViewController: UIViewController {

    @IBOutlet weak var categoryOneIV: UIImageView!
    @IBOutlet weak var categoryTwoIV: UIImageView!
    @IBOutlet weak var categoryThreeIV: UIImageView!
    
    var aqiQuestionsArray = [Quiz]()
    var ozoneSourcesQuestionsArray = [Quiz]()
    var ozoneEffectsQuestionsArray = [Quiz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addTapGestureRecognizers()
        getQuizDataFromFirebase()
       
       
    }
    
    
    
    func addTapGestureRecognizers() {
        let tapGestureRecognizerOne = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        categoryOneIV.isUserInteractionEnabled = true
        categoryOneIV.addGestureRecognizer(tapGestureRecognizerOne)
        let tapGestureRecognizerTwo = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        categoryTwoIV.isUserInteractionEnabled = true
        categoryTwoIV.addGestureRecognizer(tapGestureRecognizerTwo)
        let tapGestureRecognizerThree = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        categoryThreeIV.isUserInteractionEnabled = true
        categoryThreeIV.addGestureRecognizer(tapGestureRecognizerThree)
    }
    
    func getQuizDataFromFirebase() {
        let db = Firestore.firestore()
        db.collection("Quizzes").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let documentData = document.data()
                    let question = documentData["Question"] as! String
                    let answers = documentData["Answers"] as! [String]
                    let reason = documentData["Reason"] as! String
                    let quizCategory = documentData["QuizType"] as! String
                    let cAnswer = documentData["correctAnswer"] as! String
                    let quizObj = Quiz(question: question, answers: answers, reason: reason, category: quizCategory, correctAnswer: cAnswer)
                    if (quizCategory == "AQI") {
                        self.aqiQuestionsArray.append(quizObj)
                    } else if (quizCategory == "Ozone Sources") {
                        self.ozoneSourcesQuestionsArray.append(quizObj)
                    } else if (quizCategory == "Ozone Effects") {
                        self.ozoneEffectsQuestionsArray.append(quizObj)
                    }
                }
            }
                   
        }
    }
    
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "quizAQISegue" {
            let destination = segue.destination as! QuizScreenViewController
            destination.quizQuestionsArray = aqiQuestionsArray
        } else if (segue.identifier ==  "quizOSourcesSegue") {
            let destination = segue.destination as! QuizScreenViewController
            destination.quizQuestionsArray = ozoneSourcesQuestionsArray
        } else if (segue.identifier == "quizOEffectsSegue") {
            let destination = segue.destination as! QuizScreenViewController
            destination.quizQuestionsArray = ozoneEffectsQuestionsArray
        }
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if (tappedImage.accessibilityLabel=="aqi") {
            performSegue(withIdentifier: "quizAQISegue", sender: self)
        } else if (tappedImage.accessibilityLabel=="oSources") {
            performSegue(withIdentifier: "quizOSourcesSegue", sender: self)
        } else if (tappedImage.accessibilityLabel=="oEffects") {
            performSegue(withIdentifier: "quizOEffectsSegue", sender: self)
        }
    }
}
