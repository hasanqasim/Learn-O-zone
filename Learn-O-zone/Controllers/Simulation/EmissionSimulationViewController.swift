//
//  EmissionSimulationViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 13/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class EmissionSimulationViewController: UIViewController {

    @IBOutlet weak var aqiValueLabel: UILabel!
    @IBOutlet weak var simulationImageView: UIImageView!
    @IBOutlet weak var industrySlider: UISlider!
    @IBOutlet weak var carsSlider: UISlider!
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

    @IBAction func industrySliderTapped(_ sender: Any) {
        
        let industrySliderValue = Int(industrySlider.value*100)
        let carsSliderValue = Int(carsSlider.value*100)
        let rangeOne = 0...33
        let rangeTwo = 33...67
        let rangeThree = 67...100
    
        if (rangeOne.contains(carsSliderValue)) {
            switchImageForSlider(industrySliderValue, "balloon3", "kangaroo", "koala", "balloon")
        } else if (rangeTwo.contains(carsSliderValue)) {
            switchImageForSlider(industrySliderValue, "koala", "balloon", "kangaroo", "balloon3")
        } else if (rangeThree.contains(carsSliderValue)) {
            switchImageForSlider(industrySliderValue, "balloon", "koala", "balloon3", "kangaroo")
        }
    }
    
    @IBAction func carsSliderTapped(_ sender: Any) {
        
        let carsSliderValue = Int(carsSlider.value*100)
        let industrySliderValue = Int(industrySlider.value*100)
        let rangeOne = 0...33
        let rangeTwo = 33...67
        let rangeThree = 67...100
        
        if (rangeOne.contains(industrySliderValue)) {
            switchImageForSlider(carsSliderValue, "balloon", "kangaroo", "koala", "balloon3")
        } else if (rangeTwo.contains(industrySliderValue)) {
            switchImageForSlider(carsSliderValue, "koala", "balloon3", "kangaroo", "balloon")
        } else if (rangeThree.contains(industrySliderValue)) {
            switchImageForSlider(carsSliderValue, "balloon3", "koala", "balloon", "kangaroo")
        }
    }
    
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
