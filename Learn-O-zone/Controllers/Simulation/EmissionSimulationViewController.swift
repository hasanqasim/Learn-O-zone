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
    @IBOutlet weak var airConditionTextView: UITextView!
    @IBOutlet weak var simulationImageView: UIImageView!
    @IBOutlet weak var industrySlider: UISlider!
    @IBOutlet weak var carsSlider: UISlider!
    
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
    }
    
    @IBAction func carsSliderTapped(_ sender: Any) {
        
        let carsSliderValue = Int(carsSlider.value)
        let industrySliderValue = Int(industrySlider.value)
        let rangeOne = Int(426.939)...Int(1025.0)
        let rangeTwo = Int(1025.0)...Int(1296.01)
        let rangeThree = Int(1296.01)...Int(1461.3)
        
        if (rangeOne.contains(industrySliderValue)) {
            switchImageForCarsSlider(carsSliderValue, "IndLandCarL", "IndLandCarM", "IndLandCarH", "simulation")
        } else if (rangeTwo.contains(industrySliderValue)) {
            switchImageForCarsSlider(carsSliderValue, "IndMandCarL", "IndMandCarM", "IndMandCarH", "simulation")
        } else if (rangeThree.contains(industrySliderValue)) {
            switchImageForCarsSlider(carsSliderValue, "IndHandCarL", "IndHandCarM", "IndHandCarH", "simulation")
        }
    }
    
    func switchImageForCarsSlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case Int(5.965)...Int(7.437):
                simulationImageView.image = UIImage(named: imageNameOne)
            case Int(7.437)...Int(8.971):
                simulationImageView.image = UIImage(named: imageNameTwo)
            case Int(8.971)...Int(10.123):
                simulationImageView.image = UIImage(named: imageNameThree)
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
        }
    }
    
    func switchImageForIndustrySlider(_ sliderValue: Int, _ imageNameOne: String, _ imageNameTwo: String, _ imageNameThree: String, _ imageNameDefault: String) {
        switch sliderValue {
            case Int(426.939)...Int(1025.0):
                simulationImageView.image = UIImage(named: imageNameOne)
            case Int(1025.0)...Int(1296.01):
                simulationImageView.image = UIImage(named: imageNameTwo)
            case Int(1296.01)...Int(1461.3):
                simulationImageView.image = UIImage(named: imageNameThree)
            default:
                simulationImageView.image = UIImage(named: imageNameDefault)
        }
    }
}
