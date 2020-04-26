//
//  GuessAQIOutcomeViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 26/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class GuessAQIOutcomeViewController: UIViewController {
    
    @IBOutlet weak var guessOutcome: UILabel!
    @IBOutlet weak var congratMessage: UILabel!
    @IBOutlet weak var ozzyReactionIV: UIImageView!
    
    var currentAQIValue: Double?
    var tappedButtonColor: String?
    var aqiObject: AirQualityResponse?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let aqiValue = Int(currentAQIValue!)
        switch aqiValue {
        case 0...50:
            if (tappedButtonColor == "green") {
            view.backgroundColor = .green
            } else{
                view.backgroundColor = .gray
                ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                guessOutcome.text = "Wrong Guess"
                congratMessage.text = "OOPS !"
            }
        case 51...100:
            if (tappedButtonColor == "yellow") {
                view.backgroundColor = .yellow
            } else {
                view.backgroundColor = .gray
                ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                guessOutcome.text = "Wrong Guess"
                congratMessage.text = "OOPS !"
            }
        case 101...150:
            if (tappedButtonColor == "orange") {
                view.backgroundColor = .orange
            } else {
                view.backgroundColor = .gray
                ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                guessOutcome.text = "Wrong Guess"
                congratMessage.text = "OOPS !"
            }
        case 151...200:
            if (tappedButtonColor == "red") {
                view.backgroundColor = .red
            } else {
                view.backgroundColor = .gray
                ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                guessOutcome.text = "Wrong Guess"
                congratMessage.text = "OOPS !"
            }
        case 201...300:
            if (tappedButtonColor == "purple") {
                view.backgroundColor = .purple
            } else {
                view.backgroundColor = .gray
                ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                guessOutcome.text = "Wrong Guess"
                congratMessage.text = "OOPS !"
            }
        case 301...500:
            if (tappedButtonColor == "maroon") {
                view.backgroundColor = .brown
            } else {
                view.backgroundColor = .gray
                ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                guessOutcome.text = "Wrong Guess"
                congratMessage.text = "OOPS !"
            }
        default:
            view.backgroundColor = .white
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

}
