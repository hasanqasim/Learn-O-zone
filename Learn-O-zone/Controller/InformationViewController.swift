//
//  InformationViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 15/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    
    @IBOutlet weak var oThree: UIImageView!
    @IBOutlet weak var causes: UIImageView!
    @IBOutlet weak var sources: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGestureRecognizerO = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        oThree.isUserInteractionEnabled = true
        oThree.addGestureRecognizer(tapGestureRecognizerO)
        let tapGestureRecognizerC = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        causes.isUserInteractionEnabled = true
        causes.addGestureRecognizer(tapGestureRecognizerC)
        let tapGestureRecognizerS = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        sources.isUserInteractionEnabled = true
        sources.addGestureRecognizer(tapGestureRecognizerS)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if tappedImage.accessibilityLabel!.contains("oThree") {
            performSegue(withIdentifier: "detailedInformationSegue", sender: self)
        } else if tappedImage.accessibilityLabel!.contains("causes") {
            performSegue(withIdentifier: "detailedInformationSegue", sender: self)
        } else if tappedImage.accessibilityLabel!.contains("sources") {
            performSegue(withIdentifier: "detailedInformationSegue", sender: self)
        }
    }
    

}
