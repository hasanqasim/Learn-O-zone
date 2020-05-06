//
//  InformationViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 15/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

// this view controller manages the ozone info screen with 3 navigatin optins
class InformationViewController: UIViewController {

    
    @IBOutlet weak var oThree: UIImageView!
    @IBOutlet weak var causes: UIImageView!
    @IBOutlet weak var sources: UIImageView!
    
    var imageDetail: String = "Ground-Level-Ozone"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // enable image navigation for ozone screen
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
    // function controls what image was tapped and where the user should be navigated to
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
         let tappedImage = tapGestureRecognizer.view as! UIImageView
         
         if tappedImage.accessibilityLabel!.contains("oThree") {
             imageDetail = "Ground-Level-Ozone"
             performSegue(withIdentifier: "detailedInformationSegue", sender: self)
         } else if tappedImage.accessibilityLabel!.contains("causes") {
             imageDetail = "Ozone-Effects"
            print("image detail is \(imageDetail)")
            
             performSegue(withIdentifier: "detailedInformationSegue", sender: self)
            
         } else if tappedImage.accessibilityLabel!.contains("sources") {
             imageDetail = "Ozone-Sources"
             performSegue(withIdentifier: "detailedInformationSegue", sender: self)
         }
        
        UserDefaults.standard.set(imageDetail, forKey: "imgDetail")
     }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        if segue.identifier == "detailInformationSegue" {
//            let nextViewController = segue.destination as! SubInformationViewController
//
//            print("image detail is \(imageDetail)")
//            imageDetail = sender as! String
//            nextViewController.selectedImageDetail = imageDetail
//
//        }
        
        
    }
    
    
    
 
    

}
