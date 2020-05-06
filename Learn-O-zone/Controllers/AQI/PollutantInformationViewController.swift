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
    
    @IBOutlet weak var healthRecommendationView: UIView!
    @IBOutlet weak var healthRecommendation: UILabel!
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
        healthRecommendationView.layer.cornerRadius = 10.0
        
        aqiValue.text = "\(aqiObject!.aqiValue)"
        o3Value.text = "\(aqiObject!.pollutants[3].value)"
        co2Value.text = "\(aqiObject!.pollutants[5].value)"
        pm25Value.text = "\(aqiObject!.pollutants[0].value)"
        pm10Value.text = "\(aqiObject!.pollutants[1].value)"
        so2Value.text = "\(aqiObject!.pollutants[2].value)"
        no2Value.text = "\(aqiObject!.pollutants[4].value)"
        
        let lines = aqiObject!.healthRecommendation.components(separatedBy: ".\n")
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
