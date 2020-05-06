//
//  WelcomeViewController.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 6/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var carouselItems = CarouselItem.fetchCarouselItem()
    let cellScale: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * 1)
        let insetX = CGFloat(0.0)
        let insetY = (view.bounds.height - cellHeight) / 2.0
               
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
               layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
               
        collectionView.dataSource = self
        
        signInButton.layer.cornerRadius = CGFloat(Helper.app.welcomeButtonCornerRadius)
        signUpButton.layer.cornerRadius = CGFloat(Helper.app.welcomeButtonCornerRadius)
        
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

// MARK: - UICollectionViewDataSource

extension WelcomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WelcomeCollectionViewCell", for: indexPath) as! WelcomeCollectionViewCell
        
        let carouselItem = carouselItems[indexPath.item]
        cell.carouselItem = carouselItem
        
        return cell
    }
    
}

