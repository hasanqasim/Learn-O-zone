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

//controls the registration process. Conected to firebase for registering and storing the user
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
    var avatar = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //rounding the edges of the sign up button
        signUpButton.layer.cornerRadius = CGFloat(Helper.app.buttonCornerRadius)
        
        //changing the placeholders' colour
        usernameTextfield.attributedPlaceholder = NSAttributedString(string: "Type username here", attributes: Helper.app.titleTextAttribute)
        
        passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Type password here", attributes: Helper.app.titleTextAttribute)
        
        confirmPasswordTextfield.attributedPlaceholder = NSAttributedString(string: "Type password again here", attributes: Helper.app.titleTextAttribute)
        
        emailTextfield.attributedPlaceholder = NSAttributedString(string: "Type email here", attributes: Helper.app.titleTextAttribute)

    }
    
    //dismiss the keyboard when clicking on the textfield
    func textFieldShouldReturn (_textField: UITextField) -> Bool {
        usernameTextfield.resignFirstResponder()
        emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        confirmPasswordTextfield.resignFirstResponder()
        return true
    }
    
    // get avatar response
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
    
    // get avatr response
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
    // controls the registarton process. Checks if all good then goes ahead and registers the user on firebase
    @IBAction func signUpTapped(_ sender: Any) {
        let username = usernameTextfield.text!
        let email = emailTextfield.text!
        if (kangarooButton.isSelected) {
            avatar = "kangaroo"
        } else if (koalaButton.isSelected) {
            avatar = "koala"
        }
        
        let password = passwordTextfield.text!
        let confirmPassword = confirmPasswordTextfield.text!
        
        if (!password.isEmpty && password.elementsEqual(confirmPassword) == true && !username.isEmpty && !avatar.isEmpty) {
            saveToPreferences(username, avatar)
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let err = error {
                    self.errorAlert("Error", err.localizedDescription)
                } else {
                    let db = Firestore.firestore()
                    //db.collection("Users").addDocument(data: ["username" : username, "uid":result!.user.uid, "avatar":self.avatar, "score": 0, "bestScore": 0])
                    db.collection("Users").document(result!.user.uid).setData(["username" : username, "avatar":self.avatar, "score": 0, "bestScore": 0])
                    //self.navigationController?.popViewController(animated: true)
                    //let window = UIWindow(frame: UIScreen.main.bounds)
                    //let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    //let rootVC = storyboard.instantiateViewController(identifier: "AuthNavController") as! AuthNavController
                    //window.rootViewController = rootVC
                    //window.makeKeyAndVisible()
                }
                do {
                    try Auth.auth().signOut()
                } catch let signOutError as NSError {
                    // Show error message
                    print(signOutError)
                }
                
            }
        } else {
            errorAlert("Error", "Incomplete Registration Fields. Please Try Again")
        }
        
    }
    
    // locally persist avatar choice and username
    func saveToPreferences(_ username: String, _ avatar: String) {
        let preferences = UserDefaults.standard
        let uKey = "username"
        let aKey = "avatar"
        let uName = username
        let aName = avatar
        preferences.set(uName, forKey: uKey)
        preferences.set(aName, forKey: aKey)
        //  Save to disk
        //let didSave = preferences.synchronize()
    }
    
    func errorAlert(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler:nil))
        self.present(alertController, animated:true, completion:nil)
    }
    
}

