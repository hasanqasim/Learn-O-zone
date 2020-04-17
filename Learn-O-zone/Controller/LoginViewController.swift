//
//  ViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 7/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: Any) {
        //TODO: perform signin with tab controller
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        mainTabController.modalPresentationStyle = .fullScreen
        present(mainTabController, animated: false, completion: nil)
        //show(mainTabController, sender: self)
    }
    
}

