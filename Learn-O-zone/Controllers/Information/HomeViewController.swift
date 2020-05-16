//
//  HomeViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 15/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

// This view controller manages the home screen. It has the tab bar to navigate to the aqi screen and on tap navigation to go to ozone information screen
class HomeViewController: UIViewController {
    
    @IBOutlet weak var informationIV: UIImageView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var informationView: UIView!
    @IBOutlet weak var funFactView: UIView!

    @IBOutlet weak var funFactButton: UIButton!
    
    @IBOutlet weak var usernameTextView: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var bestScoreLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the corners of the subviews
        
        //firebase code to get user data
        let db = Firestore.firestore()
        if let userId = Auth.auth().currentUser?.uid {
            db.collection("Users").document(userId).addSnapshotListener { (snapshot, error) in
                if error == nil && snapshot != nil {
                    let documentData = snapshot?.data()
                    let username = documentData!["username"] as! String
                    let avatar = documentData!["avatar"] as! String
                    let score = documentData!["score"] as! Int
                    let bestScore = documentData!["bestScore"] as! Int
                    self.currentUser = User(username: username, avatar: avatar, score: score, bestScore: bestScore)
                    
                    CurrentUser.setCurrentUser(user: self.currentUser!)
                    self.usernameTextView.text = CurrentUser.getCurrentUser().username
                    self.currentScoreLabel.text = "\(CurrentUser.getCurrentUser().score)"
                    self.bestScoreLabel.text = "\(CurrentUser.getCurrentUser().bestScore)"
                    self.avatarImageView.image = UIImage(named: CurrentUser.getCurrentUser().avatar)
                }
            }
        }
        
        
        scoreView.layer.cornerRadius = 20
        informationView.layer.cornerRadius = 20
        funFactView.layer.cornerRadius = 20
        funFactButton.layer.cornerRadius = 10
        
        //enable tap navigation on imagview to go to ozone info screen
        let tapGestureRecognizerInfo = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        informationIV.isUserInteractionEnabled = true
        informationIV.addGestureRecognizer(tapGestureRecognizerInfo)
        
        //let tapGestureRecognizerAQI = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        //aqiIV.isUserInteractionEnabled = true
        //aqiIV.addGestureRecognizer(tapGestureRecognizerAQI)
        //quizIV.isUserInteractionEnabled = true
        //quizIV.addGestureRecognizer(tapGestureRecognizerInfo)
        
        //get username and avatar from the stored preference
        /*
        let preferences = UserDefaults.standard
        if preferences.object(forKey: "username") == nil {
            //  Doesn't exist
        } else {
            let username = preferences.string(forKey: "username")
            let avatar = preferences.string(forKey: "avatar")
            usernameTextView.text = username
            avatarImageView.image = UIImage(named: avatar!)
            
        }
        */
        //populate the UI
        
        
    }
    

//    override func viewDidAppear(_ animated: Bool) {
//          let nav = self.navigationController?.navigationBar
//
//          let orange = UIColor(hexString: "ffa34d")
//          let lightMint = UIColor(hexString: "d4f8e8")
//          nav?.barTintColor = orange
//          nav?.titleTextAttributes = [.foregroundColor: lightMint]
//      }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     if segue.identifier == "informationSegue" {
                let controller = segue.destination as! InformationViewController
            }
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (CurrentUser.currentUser != nil) {
            currentScoreLabel.text = "\(CurrentUser.getCurrentUser().score)"
            bestScoreLabel.text = "\(CurrentUser.getCurrentUser().bestScore)"
        }
       
        
    }
    
    // on tap image this method sends user to the zone info screen
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if tappedImage.accessibilityLabel!.contains("info") {
            performSegue(withIdentifier: "informationSegue", sender: self)
        }
        //self.navigationController?.pushViewController(InformationViewController(), animated: false)
    }
    
    // logs the user out and sends them to the login screen
    @IBAction func logOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            // Show error message
            print(signOutError)
        }
        dismiss(animated: true, completion: nil)
    }
    
     


}
