//
//  ViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 7/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import FirebaseAuth
//comment
// This view controller manages the login page. Also has navigation to thre registration page where user can sign up
class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.emailTextfield.delegate = self
        
        //changing the placeholders' colour
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "Type email here", attributes: Helper.app.titleTextAttribute)
        
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Type password here", attributes: Helper.app.titleTextAttribute)
        
        //rounding the button edges
        signInButton.layer.cornerRadius = CGFloat(Helper.app.buttonCornerRadius)
        signUpButton.layer.cornerRadius = CGFloat(Helper.app.buttonCornerRadius)
    }
    
    
    //dismiss the keyboard when clicking on the textfield
    func textFieldShouldReturn (_textField: UITextField) -> Bool {
        emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        return true
    }

    //Let the user signin with correct credentials otherwise display error and attempt sign in again
    @IBAction func signIn(_ sender: Any) {
        //TODO: perform signin with tab controller
        let email = emailTextfield.text!
        let password = passwordTextfield.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorAlert(title: "ERROR", message: error!.localizedDescription)
            } else {
                let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
                mainTabController.modalPresentationStyle = .fullScreen
                self.present(mainTabController, animated: false, completion: nil)
                self.emailTextfield.text = ""
                self.passwordTextfield.text = ""
            }
        }
        //show(mainTabController, sender: self)
       
    }
    
    // displays error incase of invalid login credentials
    func errorAlert(title: String, message: String) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
           alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler:nil))
           self.present(alertController, animated:true, completion:nil)
       }
    
}


