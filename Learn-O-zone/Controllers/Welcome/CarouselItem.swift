//
//  CarouselItem.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 6/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class CarouselItem
{
    var featuredImage: UIImage
    
    init(featuredImage: UIImage) {
        self.featuredImage = featuredImage
    }
    
    
    static func fetchCarouselItem() -> [CarouselItem]
    {
        return [
        CarouselItem(featuredImage: #imageLiteral(resourceName: "1")),
        CarouselItem(featuredImage: #imageLiteral(resourceName: "2")),
        CarouselItem(featuredImage: #imageLiteral(resourceName: "3"))
        ]
    }
}
