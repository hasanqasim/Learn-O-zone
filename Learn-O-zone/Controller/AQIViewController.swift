//
//  AQIViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 17/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class AQIViewController: UIViewController {

    @IBOutlet weak var oneIV: UIImageView!
    @IBOutlet weak var twoIV: UIImageView!
    @IBOutlet weak var threeIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGestureRecognizerOne = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        oneIV.isUserInteractionEnabled = true
        oneIV.addGestureRecognizer(tapGestureRecognizerOne)
        let tapGestureRecognizerTwo = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        twoIV.isUserInteractionEnabled = true
        twoIV.addGestureRecognizer(tapGestureRecognizerTwo)
        let tapGestureRecognizerThree = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        threeIV.isUserInteractionEnabled = true
        threeIV.addGestureRecognizer(tapGestureRecognizerThree)
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
           let tappedImage = tapGestureRecognizer.view as! UIImageView
           
           if tappedImage.accessibilityLabel!.contains("one") {
               performSegue(withIdentifier: "segueOne", sender: self)
           } else if tappedImage.accessibilityLabel!.contains("two") {
               performSegue(withIdentifier: "segueTwo", sender: self)
           } else if tappedImage.accessibilityLabel!.contains("three") {
               performSegue(withIdentifier: "segueThree", sender: self)
           }
       }
       
 
}
