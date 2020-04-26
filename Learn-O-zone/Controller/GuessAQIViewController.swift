//
//  GuessAQIViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 26/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class GuessAQIViewController: UIViewController {

    @IBOutlet weak var aqiValue: UILabel!
    var aqiObject: AirQualityResponse?
    var currentAQIValue: Double?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentAQIValue = aqiObject?.aqiValue
        aqiValue.text = "\(currentAQIValue!)"
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       
        if (segue.identifier == "redSegue") {
            let destination = segue.destination as! GuessAQIOutcomeViewController
            destination.currentAQIValue = currentAQIValue
            destination.tappedButtonColor = "red"
        } else if (segue.identifier == "greenSegue") {
            let destination = segue.destination as! GuessAQIOutcomeViewController
            destination.currentAQIValue = currentAQIValue
            destination.tappedButtonColor = "green"
        } else if (segue.identifier == "purpleSegue") {
            let destination = segue.destination as! GuessAQIOutcomeViewController
            destination.currentAQIValue = currentAQIValue
            destination.tappedButtonColor = "purple"
        } else if (segue.identifier == "maroonSegue") {
            let destination = segue.destination as! GuessAQIOutcomeViewController
            destination.currentAQIValue = currentAQIValue
            destination.tappedButtonColor = "maroon"
        } else if (segue.identifier == "orangeSegue") {
            let destination = segue.destination as! GuessAQIOutcomeViewController
            destination.currentAQIValue = currentAQIValue
            destination.tappedButtonColor = "orange"
        } else if (segue.identifier == "yellowSegue") {
            let destination = segue.destination as! GuessAQIOutcomeViewController
            destination.currentAQIValue = currentAQIValue
            destination.tappedButtonColor = "yellow"
        }
    }
    

   
}
