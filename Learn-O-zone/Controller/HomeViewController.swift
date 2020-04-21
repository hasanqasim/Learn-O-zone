//
//  HomeViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 15/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var informationIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGestureRecognizerInfo = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        informationIV.isUserInteractionEnabled = true
        informationIV.addGestureRecognizer(tapGestureRecognizerInfo)
        //let tapGestureRecognizerAQI = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        //aqiIV.isUserInteractionEnabled = true
        //aqiIV.addGestureRecognizer(tapGestureRecognizerAQI)
        //quizIV.isUserInteractionEnabled = true
        //quizIV.addGestureRecognizer(tapGestureRecognizerInfo)
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
     if segue.identifier == "informationSegue" {
                let controller = segue.destination as! InformationViewController
            }
    }
    */
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if tappedImage.accessibilityLabel!.contains("info") {
            performSegue(withIdentifier: "informationSegue", sender: self)
        }
        //self.navigationController?.pushViewController(InformationViewController(), animated: false)
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
     


}
