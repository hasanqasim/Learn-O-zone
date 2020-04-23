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
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "Type email here", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "d4f8e8")])
        
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Type password here", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "d4f8e8")])
        
        //rounding the button edges
        signInButton.layer.cornerRadius = 25.0
        signUpButton.layer.cornerRadius = 25.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        
        let lightMint = UIColor(hexString: "d4f8e8")
        let softPeach = UIColor(hexString: "f67575")
        nav?.barTintColor = lightMint
        nav?.titleTextAttributes = [.foregroundColor: softPeach]
    }
    
    //dismiss the keyboard when clicking on the textfield
    func textFieldShouldReturn (_textField: UITextField) -> Bool {
        emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        return true
    }

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
            }
        }
        //show(mainTabController, sender: self)
    }
    
    func errorAlert(title: String, message: String) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
           alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler:nil))
           self.present(alertController, animated:true, completion:nil)
       }
    
}


//extension to convert hexString to UIColor
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
   
}
