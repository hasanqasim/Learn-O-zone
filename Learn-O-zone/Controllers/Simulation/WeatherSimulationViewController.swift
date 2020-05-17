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

    @IBOutlet weak var ozoneLevelTextView: UITextView!
    @IBOutlet weak var simulationImageView: UIImageView!
    @IBOutlet weak var temperatureSlider: UISlider!
    @IBOutlet weak var windSlider: UISlider!
    var currentCondition: String = "TemLandWindL"
    
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
        let rangeOne = Int(7.749)...Int(12.5)
        let rangeTwo = Int(12.5)...Int(15.764)
        let rangeThree = Int(15.764)...Int(21.083)
               
        if (rangeOne.contains(windSliderValue)) {
            switchImageForTemperatureSlider(temperatureSliderValue, "TemLandWindL", "TemMandWindL", "TemHandWindL", "simulation")
        } else if (rangeTwo.contains(windSliderValue)) {
            switchImageForTemperatureSlider(temperatureSliderValue, "TemLandWindM", "TemMandWindM", "TemHandWindM", "simulation")
        } else if (rangeThree.contains(windSliderValue)) {
            switchImageForTemperatureSlider(temperatureSliderValue, "TemLandWindH", "TemMandWindH", "TemHandWindH", "simulation")
        }
        updateOzoneLevel()
    }
    
    @IBAction func windSliderTapped(_ sender: Any) {
        let windSliderValue = Int(windSlider.value)
        let temperatureSliderValue = Int(temperatureSlider.value)
        let rangeOne = Int(-2)...Int(7.2)
        let rangeTwo = Int(7.2)...Int(24.9)
        let rangeThree = Int(24.9)...Int(45.2)
        
        if (rangeOne.contains(temperatureSliderValue)) {
            switchImageForWindSlider(windSliderValue, "TemLandWindL", "TemLandWindM", "TemLandWindH", "simulation")
        } else if (rangeTwo.contains(temperatureSliderValue)) {
            switchImageForWindSlider(windSliderValue, "TemMandWindL", "TemMandWindM", "TemMandWindH", "simulation")
        } else if (rangeThree.contains(temperatureSliderValue)) {
            switchImageForWindSlider(windSliderValue, "TemHandWindL", "TemHandWindM", "TemHandWindH", "simulation")
        }
        updateOzoneLevel()
    }
    
    // changes image based on slider value low moderate high
    func switchImageForWindSlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case Int(7.749)...Int(12.5):
                simulationImageView.image = UIImage(named: imageNameOne)
                currentCondition = imageNameOne
            case Int(12.5)...Int(15.764):
                simulationImageView.image = UIImage(named: imageNameTwo)
                currentCondition = imageNameTwo
            case Int(15.764)...Int(21.083):
                simulationImageView.image = UIImage(named: imageNameThree)
                currentCondition = imageNameThree
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
                currentCondition = imageNameDefault
        }
    }
    
    // changes image based on slider value low moderate high
    func switchImageForTemperatureSlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case Int(-2)...Int(7.2):
                simulationImageView.image = UIImage(named: imageNameOne)
                currentCondition = imageNameOne
            case Int(7.2)...Int(24.9):
                simulationImageView.image = UIImage(named: imageNameTwo)
                currentCondition = imageNameTwo
            case Int(24.9)...Int(45.2):
                simulationImageView.image = UIImage(named: imageNameThree)
                currentCondition = imageNameThree
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
                currentCondition = imageNameDefault
        }
    }
    
    func updateOzoneLevel(){
        switch currentCondition {
        case "TemLandWindL":
            ozoneLevelTextView.text = "Moderate"
        case "TemLandWindM":
            ozoneLevelTextView.text = "Fairly Low"
        case "TemLandWindH":
            ozoneLevelTextView.text = "Low"
        case "TemMandWindL":
            ozoneLevelTextView.text = "High"
        case "TemMandWindM":
            ozoneLevelTextView.text = "Moderate"
        case "TemMandWindH":
            ozoneLevelTextView.text = "Fairly Low"
        case "TemHandWindL":
            ozoneLevelTextView.text = "Very High"
        case "TemHandWindM":
            ozoneLevelTextView.text = "Moderate"
        case "TemHandWindH":
            ozoneLevelTextView.text = "Moderate"
        default:
            ozoneLevelTextView.text = "Moderate"
        }
    }
}
