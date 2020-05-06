//
//  WelcomeCollectionViewCell.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 6/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class WelcomeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var featuredImage: UIImageView!
    
    var carouselItem: CarouselItem! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let carouselItem = carouselItem {
            featuredImage.image = carouselItem.featuredImage
        }
        
        featuredImage.layer.cornerRadius = 10.0
        featuredImage.layer.masksToBounds = true
        featuredImage.layer.borderWidth = 2
        featuredImage.layer.borderColor = UIColor.white.cgColor
    }
    
}
