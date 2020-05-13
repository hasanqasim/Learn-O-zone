//
//  WeatherSimulationViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 13/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class WeatherSimulationViewController: UIViewController {

    @IBOutlet weak var aqiValueLabel: UILabel!
    @IBOutlet weak var simulationImageView: UIImageView!
    @IBOutlet weak var temperatureSlider: UISlider!
    @IBOutlet weak var windSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func temperatureSliderTapped(_ sender: Any) {
        
        let temperatureSliderValue = Int(temperatureSlider.value*100)
        let windSliderValue = Int(windSlider.value*100)
        let rangeOne = 0...33
        let rangeTwo = 33...67
        let rangeThree = 67...100
               
        if (rangeOne.contains(windSliderValue)) {
            switchImageForSlider(temperatureSliderValue, "balloon", "kangaroo", "koala", "balloon3")
        } else if (rangeTwo.contains(windSliderValue)) {
            switchImageForSlider(temperatureSliderValue, "koala", "balloon3", "kangaroo", "balloon")
        } else if (rangeThree.contains(windSliderValue)) {
            switchImageForSlider(temperatureSliderValue, "balloon3", "koala", "balloon", "kangaroo")
        }
    }
    
    @IBAction func windSliderTapped(_ sender: Any) {
        let windSliderValue = Int(windSlider.value*100)
        let temperatureSliderValue = Int(temperatureSlider.value*100)
        let rangeOne = 0...33
        let rangeTwo = 33...67
        let rangeThree = 67...100
        
        if (rangeOne.contains(temperatureSliderValue)) {
            switchImageForSlider(windSliderValue, "balloon", "kangaroo", "koala", "balloon3")
        } else if (rangeTwo.contains(temperatureSliderValue)) {
            switchImageForSlider(windSliderValue, "koala", "balloon3", "kangaroo", "balloon")
        } else if (rangeThree.contains(temperatureSliderValue)) {
            switchImageForSlider(windSliderValue, "balloon3", "koala", "balloon", "kangaroo")
        }
    }
    
    // chnages image based on slider value low moderate high
    func switchImageForSlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case 0...33:
                simulationImageView.image = UIImage(named: imageNameOne)
            case 33...67:
                simulationImageView.image = UIImage(named: imageNameTwo)
            case 67...100:
                simulationImageView.image = UIImage(named: imageNameThree)
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
        }
    }
}
