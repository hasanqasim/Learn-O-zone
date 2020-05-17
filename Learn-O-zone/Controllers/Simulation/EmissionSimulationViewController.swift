//
//  EmissionSimulationViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 13/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class EmissionSimulationViewController: UIViewController {

    
    @IBOutlet weak var carsView: UIView!
    @IBOutlet weak var industryView: UIView!
    @IBOutlet weak var airConditionView: UIView!

    @IBOutlet weak var ozoneLevelTextView: UITextView!
    @IBOutlet weak var simulationImageView: UIImageView!
    @IBOutlet weak var industrySlider: UISlider!
    @IBOutlet weak var carsSlider: UISlider!
    var currentCondition: String = "IndLandCarL"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the edges of airCondition, industry and cars UIViews
        airConditionView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        industryView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        carsView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func industrySliderTapped(_ sender: Any) {
        
        let industrySliderValue = Int(industrySlider.value)
        let carsSliderValue = Int(carsSlider.value)
        let rangeOne = Int(5.965)...Int(7.437)
        let rangeTwo = Int(7.437)...Int(8.971)
        let rangeThree = Int(8.971)...Int(10.123)
    
        if (rangeOne.contains(carsSliderValue)) {
            switchImageForIndustrySlider(industrySliderValue, "IndLandCarL", "IndMandCarL", "IndHandCarL", "simulation")
        } else if (rangeTwo.contains(carsSliderValue)) {
            switchImageForIndustrySlider(industrySliderValue, "IndLandCarM", "IndMandCarM", "IndHandCarM", "simulation")
        } else if (rangeThree.contains(carsSliderValue)) {
            switchImageForIndustrySlider(industrySliderValue, "IndLandCarH", "IndMandCarH", "IndHandCarH", "simulation")
        }
        updateOzoneLevel()
    }
    
    @IBAction func carsSliderTapped(_ sender: Any) {
        
        let carsSliderValue = Int(carsSlider.value)
        let industrySliderValue = Int(industrySlider.value)
        let rangeOne = Int(845.069)...Int(1535.62)
        let rangeTwo = Int(1535.62)...Int(2426.67)
        let rangeThree = Int(2426.67)...Int(3158.63)
        
        if (rangeOne.contains(industrySliderValue)) {
            switchImageForCarsSlider(carsSliderValue, "IndLandCarL", "IndLandCarM", "IndLandCarH", "simulation")
        } else if (rangeTwo.contains(industrySliderValue)) {
            switchImageForCarsSlider(carsSliderValue, "IndMandCarL", "IndMandCarM", "IndMandCarH", "simulation")
        } else if (rangeThree.contains(industrySliderValue)) {
            switchImageForCarsSlider(carsSliderValue, "IndHandCarL", "IndHandCarM", "IndHandCarH", "simulation")
        }
        updateOzoneLevel()
    }
    
    func switchImageForCarsSlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case Int(5.965)...Int(7.437):
                simulationImageView.image = UIImage(named: imageNameOne)
                currentCondition = imageNameOne
            case Int(7.437)...Int(8.971):
                simulationImageView.image = UIImage(named: imageNameTwo)
                currentCondition = imageNameTwo
            case Int(8.971)...Int(10.123):
                simulationImageView.image = UIImage(named: imageNameThree)
                currentCondition = imageNameThree
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
                currentCondition = imageNameDefault
        }
    }
    
    func switchImageForIndustrySlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case Int(845.069)...Int(1535.62):
                simulationImageView.image = UIImage(named: imageNameOne)
                currentCondition = imageNameOne
            case Int(1535.62)...Int(2426.67):
                simulationImageView.image = UIImage(named: imageNameTwo)
                currentCondition = imageNameTwo
            case Int(2426.67)...Int(3158.63):
                simulationImageView.image = UIImage(named: imageNameThree)
                currentCondition = imageNameThree
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
                currentCondition = imageNameDefault
        }
    }
    
    func updateOzoneLevel(){
        switch currentCondition {
        case "IndLandCarL":
            ozoneLevelTextView.text = "Low"
        case "IndLandCarM":
            ozoneLevelTextView.text = "Fairly Low"
        case "IndLandCarH":
            ozoneLevelTextView.text = "Moderate"
        case "IndMandCarL":
            ozoneLevelTextView.text = "Fairly Low"
        case "IndMandCarM":
            ozoneLevelTextView.text = "Moderate"
        case "IndMandCarH":
            ozoneLevelTextView.text = "High"
        case "IndHandCarL":
            ozoneLevelTextView.text = "Moderate"
        case "IndHandCarM":
            ozoneLevelTextView.text = "High"
        case "IndHandCarH":
            ozoneLevelTextView.text = "Very High"
        default:
            ozoneLevelTextView.text = "Moderate"
        }
    }
}
