//
//  QuizPositiveOutcomeViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 16/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class QuizOutcomeViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        avatarImageView.image = UIImage(named: CurrentUser.getCurrentUser().avatar)
        usernameLabel.text = CurrentUser.getCurrentUser().username
        currentScoreLabel.text = "\(CurrentUser.getCurrentUser().score)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backToCategoriesButtonTapped(_ sender: Any) {
        
    }
}
