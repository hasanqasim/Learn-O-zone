//
//  ViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 7/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.usernameTextfield.delegate = self
        
        //rounding the button edges
        signInButton.layer.cornerRadius = 25.0
        signUpButton.layer.cornerRadius = 25.0
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        let nav = self.navigationController?.navigationBar
//        
//        let lightMint = UIColor(hexFromString: "d4f8e8")
//        let softPeach = UIColor(hexFromString: "f67575")
//        nav?.barTintColor = lightMint
//        nav?.titleTextAttributes = [.foregroundColor: softPeach]
//    }
    
    //dismiss the keyboard when clicking on the textfield
    func textFieldShouldReturn (_textField: UITextField) -> Bool {
        usernameTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        return true
    }

    @IBAction func signIn(_ sender: Any) {
        //TODO: perform signin with tab controller
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        mainTabController.modalPresentationStyle = .fullScreen
        present(mainTabController, animated: false, completion: nil)
        //show(mainTabController, sender: self)
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
