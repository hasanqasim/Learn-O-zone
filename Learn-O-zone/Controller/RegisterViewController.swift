//
//  RegisterViewController.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 19/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

//comment
class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    @IBOutlet weak var kangarooButton: UIButton!
    @IBOutlet weak var koalaButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var kangarooBoolean = false
    var KoalaBoolean = false
    var avatar: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the edges of the sign up button
        signUpButton.layer.cornerRadius = 25.0
        
        //changing the placeholders' colour
        usernameTextfield.attributedPlaceholder = NSAttributedString(string: "Type username here", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "d4f8e8")])
        
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Type password here", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "d4f8e8")])
        
        confirmPasswordTextfield.attributedPlaceholder = NSAttributedString(string: "Type password again here", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "d4f8e8")])
        
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "Type email here", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "d4f8e8")])

    }
    
    override func viewDidAppear(_ animated: Bool) {
          let nav = self.navigationController?.navigationBar
          
          let lightMint = UIColor(hexString: "d4f8e8")
          let softPeach = UIColor(hexString: "f67575")
          nav?.barTintColor = lightMint
          nav?.titleTextAttributes = [.foregroundColor: softPeach]
      }

    @IBAction func kangarooButtonAction(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            koalaButton.isSelected = false
        }
        else {
            sender.isSelected = true
            koalaButton.isSelected = false
            print("kangaroo \(kangarooButton.isSelected)")
        }
        
    }
    
    
    @IBAction func koalaButtonAction(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            kangarooButton.isSelected = false
        }
        else {
            sender.isSelected = true
            kangarooButton.isSelected = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signUpTapped(_ sender: Any) {
        let userName = usernameTextfield.text!
        let email = emailTextfield.text!
        if (kangarooButton.isSelected) {
            avatar = "kangaroo"
        } else if (koalaButton.isSelected) {
            avatar = "koala"
        }
        let password = passwordTextfield.text!
        let confirmPassword = confirmPasswordTextfield.text!
        
        if (password.elementsEqual(confirmPassword) == true) {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    let db = Firestore.firestore()
                    db.collection("Users").addDocument(data: ["username" : userName, "uid":result!.user.uid, "avatar":self.avatar!])
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
        }
        
    }
}

