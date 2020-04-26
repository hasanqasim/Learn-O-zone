//
//  AuthNavViewController.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 23/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class AuthNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.barTintColor = Helper.app.signInBarTintColour
        navigationBar.titleTextAttributes = [.foregroundColor: Helper.app.signInBarTitleColour!]
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
