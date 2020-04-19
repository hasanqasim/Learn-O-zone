//
//  RegisterViewController.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 19/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

//comment
class RegisterViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the edges of the sign up button
        signUpButton.layer.cornerRadius = 25.0
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

