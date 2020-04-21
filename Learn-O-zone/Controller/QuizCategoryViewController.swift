//
//  QuizCategoryViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 20/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class QuizCategoryViewController: UIViewController {

    @IBOutlet weak var categoryOneIV: UIImageView!
    @IBOutlet weak var categoryTwoIV: UIImageView!
    @IBOutlet weak var categoryThreeIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    override func viewDidAppear(_ animated: Bool) {
           let nav = self.navigationController?.navigationBar
           
           let orange = UIColor(hexString: "ffa34d")
           let lightMint = UIColor(hexString: "d4f8e8")
           nav?.barTintColor = orange
           nav?.titleTextAttributes = [.foregroundColor: lightMint]
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        //et tappedImage = tapGestureRecognizer.view as! UIImageView
        performSegue(withIdentifier: "quizSegue", sender: self)
    }
}
