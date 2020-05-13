//
//  WeatherSimulationViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 13/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class WeatherSimulationViewController: UIViewController {

    @IBOutlet weak var airConditionView: UIView!
    @IBOutlet weak var temperatureView: UIView!
    @IBOutlet weak var windView: UIView!
    @IBOutlet weak var airConditionTextView: UITextView!
    @IBOutlet weak var simulationImageView: UIImageView!
    @IBOutlet weak var temperatureSlider: UISlider!
    @IBOutlet weak var windSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the temperaturem airCondition and wind UIViews
        temperatureView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        windView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        airConditionView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
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
        
        let temperatureSliderValue = Int(temperatureSlider.value)
        let windSliderValue = Int(windSlider.value)
        let rangeOne = Int(286.713)...Int(319.476)
        let rangeTwo = Int(319.476)...Int(344.905)
        let rangeThree = Int(344.905)...Int(366.571)
               
        if (rangeOne.contains(windSliderValue)) {
            switchImageForTemperatureSlider(temperatureSliderValue, "TemLandWindL", "TemMandWindL", "TemHandWindL", "simulation")
        } else if (rangeTwo.contains(windSliderValue)) {
            switchImageForTemperatureSlider(temperatureSliderValue, "TemLandWindM", "TemMandWindM", "TemHandWindM", "simulation")
        } else if (rangeThree.contains(windSliderValue)) {
            switchImageForTemperatureSlider(temperatureSliderValue, "TemLandWindH", "TemMandWindH", "TemHandWindH", "simulation")
        }
    }
    
    @IBAction func windSliderTapped(_ sender: Any) {
        let windSliderValue = Int(windSlider.value)
        let temperatureSliderValue = Int(temperatureSlider.value)
        let rangeOne = Int(3)...Int(11)
        let rangeTwo = Int(11)...Int(23)
        let rangeThree = Int(23)...Int(43)
        
        if (rangeOne.contains(temperatureSliderValue)) {
            switchImageForWindSlider(windSliderValue, "TemLandWindL", "TemLandWindM", "TemLandWindH", "simulation")
        } else if (rangeTwo.contains(temperatureSliderValue)) {
            switchImageForWindSlider(windSliderValue, "TemMandWindL", "TemMandWindM", "TemMandWindH", "simulation")
        } else if (rangeThree.contains(temperatureSliderValue)) {
            switchImageForWindSlider(windSliderValue, "TemHandWindL", "TemHandWindL", "TemHandWindL", "simulation")
        }
    }
    
    // changes image based on slider value low moderate high
    func switchImageForWindSlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case Int(286.713)...Int(319.476):
                simulationImageView.image = UIImage(named: imageNameOne)
            case Int(319.476)...Int(344.905):
                simulationImageView.image = UIImage(named: imageNameTwo)
            case Int(344.905)...Int(366.571):
                simulationImageView.image = UIImage(named: imageNameThree)
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
        }
    }
    
    // changes image based on slider value low moderate high
    func switchImageForTemperatureSlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case 3...11:
                simulationImageView.image = UIImage(named: imageNameOne)
            case 11...23:
                simulationImageView.image = UIImage(named: imageNameTwo)
            case 23...43:
                simulationImageView.image = UIImage(named: imageNameThree)
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
        }
    }
}
