//
//  GuessAQIOutcomeViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 26/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
// this screen pops up when user guessess the current aqi
class GuessAQIOutcomeViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var guessOutcome: UILabel!
    @IBOutlet weak var congratMessage: UILabel!
    @IBOutlet weak var ozzyReactionIV: UIImageView!
    @IBOutlet weak var backToAQIButton: UIButton!
    
    var currentAQIValue: Double?
    var tappedButtonColor: String?
    var aqiObject: AirQualityResponse?
    var aqiValue = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backToAQIButton.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        
        // this switch statement checks if the guess is correct or not then display relevant information accordingly
        self.navigationItem.setHidesBackButton(true, animated: true);
        aqiValue = Int(currentAQIValue!)
        switchStatement()
        usernameLabel.text = CurrentUser.getCurrentUser().username
    }
        
        //this fills the username label with the username of the logged in user
    func switchStatement() {
        switch aqiValue {
            case 0...50:
                if (tappedButtonColor == "green") {
                view.backgroundColor = UIColor(hexString: "ADD461")
                } else{
                    view.backgroundColor = .gray
                    ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                    guessOutcome.text = "Wrong Guess"
                    congratMessage.text = "OOPS !"
                }
            case 51...100:
                if (tappedButtonColor == "yellow") {
                    view.backgroundColor = UIColor(hexString: "F8D258")
                } else {
                    view.backgroundColor = .gray
                    ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                    guessOutcome.text = "Wrong Guess"
                    congratMessage.text = "OOPS !"
                }
            case 101...150:
                if (tappedButtonColor == "orange") {
                    view.backgroundColor = UIColor(hexString: "F39C5E")
                } else {
                    view.backgroundColor = .gray
                    ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                    guessOutcome.text = "Wrong Guess"
                    congratMessage.text = "OOPS !"
                }
            case 151...200:
                if (tappedButtonColor == "red") {
                    view.backgroundColor = UIColor(hexString: "F37674")
                } else {
                    view.backgroundColor = .gray
                    ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                    guessOutcome.text = "Wrong Guess"
                    congratMessage.text = "OOPS !"
                }
            case 201...300:
                if (tappedButtonColor == "purple") {
                    view.backgroundColor = UIColor(hexString: "A383BC")
                } else {
                    view.backgroundColor = .gray
                    ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                    guessOutcome.text = "Wrong Guess"
                    congratMessage.text = "OOPS !"
                }
            case 301...500:
                if (tappedButtonColor == "maroon") {
                    view.backgroundColor = UIColor(hexString: "945E74")
                } else {
                    view.backgroundColor = .gray
                    ozzyReactionIV.image = #imageLiteral(resourceName: "0ZZY-sad")
                    guessOutcome.text = "Wrong Guess"
                    congratMessage.text = "OOPS !"
                }
            default:
                view.backgroundColor = .gray
        
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

    @IBAction func backToAQIScreenButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
