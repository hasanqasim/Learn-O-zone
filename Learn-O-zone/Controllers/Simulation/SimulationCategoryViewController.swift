//
//  SimulationCategoryViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 13/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class SimulationCategoryViewController: UIViewController {

    @IBOutlet weak var emissionsBtn: UIButton!
    @IBOutlet weak var weatherBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the edges of the weather and emissions buttons
        emissionsBtn.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        weatherBtn.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
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
