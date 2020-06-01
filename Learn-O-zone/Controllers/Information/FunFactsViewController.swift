//
//  FunFactsViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 10/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import Firebase

class FunFactsViewController: UIViewController {

    @IBOutlet weak var funFactTextView: UITextView!
    @IBOutlet weak var giftBoxIV: UIImageView!
    @IBOutlet weak var funFactButton: UIButton!
   
    @IBOutlet weak var returnMessageTextView: UITextView!
    var funFacts = [FunFact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        funFactButton.layer.cornerRadius = 10.0
        
        getFunFactsFromFirebase()
        
    }
    
    @IBAction func generateFunFact(_ sender: Any) {
        returnMessageTextView.text = "Come back for more.."
        CurrentUser.setFunFactIsActive(true)
        funFacts = funFacts.shuffled()
        funFactTextView.text = funFacts[0].fact
        giftBoxIV.image = #imageLiteral(resourceName: "opengiftbox")
        //giftBoxIV.frame.size = CGSize(width: 300, height: 300)
        self.funFactButton.isEnabled = false
    }
    
   
    func getFunFactsFromFirebase() {
        let db = Firestore.firestore()
        db.collection("FunFacts").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let documentData = document.data()
                    let fact = documentData["Fact"] as! String
                    let funFactObj = FunFact(fact: fact)
                    self.funFacts.append(funFactObj)
                }
            }
        }
    }
}
