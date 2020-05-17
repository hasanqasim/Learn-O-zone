//
//  FactorInfoViewController.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 17/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class FactorInfoViewController: UIViewController {

    @IBOutlet weak var factorLabel: UILabel!
    @IBOutlet weak var factorIV: UIImageView!
    @IBOutlet weak var factorInfoTextView: UITextView!
    @IBOutlet weak var rangeTextView: UITextView!
    var factorInfo: String = ""
    var rangeInfo: String = ""
    var factorImageString: String = ""
    var factorName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the edges of the textviews
        factorInfoTextView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        rangeTextView.layer.cornerRadius = CGFloat(Helper.app.smallButtonCornerRadius)
        
        print(factorImageString)
        print(factorInfo)
        print(rangeInfo)
        factorLabel.text = factorName
        factorIV.image = UIImage(named: factorImageString)
        factorInfoTextView.text = factorInfo
        rangeTextView.text = rangeInfo
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
