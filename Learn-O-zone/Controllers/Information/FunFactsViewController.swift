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

    @IBOutlet weak var giftBoxIV: UIImageView!
    @IBOutlet weak var funFactButton: UIButton!
    @IBOutlet weak var funFactTextView: UITextView!
    
    var funFacts = [FunFact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        funFactButton.layer.cornerRadius = CGFloat(Helper.app.buttonCornerRadius)
        
        getFunFactsFromFirebase()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func generateFunFact(_ sender: Any) {
        funFacts = funFacts.shuffled()
        funFactTextView.text = funFacts[0].fact
        giftBoxIV.image = #imageLiteral(resourceName: "opengiftbox")
        giftBoxIV.frame.size = CGSize(width: 300, height: 300)
       
        
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
