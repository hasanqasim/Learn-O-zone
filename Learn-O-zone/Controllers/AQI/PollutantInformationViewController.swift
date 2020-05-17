//
//  PollutantInformationViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 26/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
// controls pollutant information screen and displays all the relevant pollutnat information on the screen
class PollutantInformationViewController: UIViewController {
    //let pollutants = [pm25Obj, pm10Obj, so2Obj, o3Obj, no2Obj, coObj]
    
    @IBOutlet weak var healthRecommendation: UITextView!
    @IBOutlet weak var healthRecommendationView: UIView!
 
    @IBOutlet weak var aqiValue: UILabel!
    @IBOutlet weak var o3Value: UILabel!
    @IBOutlet weak var co2Value: UILabel!
    @IBOutlet weak var pm25Value: UILabel!
    @IBOutlet weak var pm10Value: UILabel!
    @IBOutlet weak var so2Value: UILabel!
    @IBOutlet weak var no2Value: UILabel!
    var aqiObject: AirQualityResponse?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the corner edges of the heath recommendation view
        healthRecommendationView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        
        //assigning the pollutant concentrations to the relevant labels
        //rounding the concentration value for o3, no2, so2 and co to 3 decimal places
        //converting ppb values to ppm values
        aqiValue.text = "\(aqiObject!.aqiValue)"
        o3Value.text = String(format: "%.3f", aqiObject!.pollutants[3].value/1000)
        co2Value.text = String(format: "%.3f", aqiObject!.pollutants[3].value/1000)
        so2Value.text = String(format: "%.3f", aqiObject!.pollutants[3].value/1000)
        no2Value.text = String(format: "%.3f", aqiObject!.pollutants[3].value/1000)
        pm25Value.text = "\(aqiObject!.pollutants[0].value)"
        pm10Value.text = "\(aqiObject!.pollutants[1].value)"
        
        
        //extracting the last line, the most relevant health recommendation for kids from the air quality reponse object and assigning it to the TextView
        let lines = aqiObject!.healthRecommendation.components(separatedBy: ". ")
        healthRecommendation.text = "\(lines.last ?? "Please be safe outside")"
        
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
