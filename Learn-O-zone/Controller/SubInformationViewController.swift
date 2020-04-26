//
//  SubInformationViewController.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 24/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class SubInformationViewController: UIViewController {
    
   
    @IBOutlet weak var infoImageView: UIImageView!
    
    var selectedImageDetail: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
        var returnValue = UserDefaults.standard.string(forKey: "imgDetail")
        selectedImageDetail = returnValue!
        print("selectedImageDetail is \(selectedImageDetail)")
        infoImageView.image = UIImage(named: selectedImageDetail)
        
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
