//
//  Helper.swift
//  Learn-O-zone
//
//  Created by Laveeshka on 23/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//
import UIKit

class Helper {
    static var app: Helper =  {
            return Helper()
    }()
    
    let signInBarTintColour: UIColor! = UIColor(hexString: "d4f8e8")
    let signInBarTitleColour: UIColor! = UIColor(hexString: "f67575")
    let placeHolderColour: UIColor! = UIColor(hexString: "d4f8e8")
    let primaryBarTintColour: UIColor! = UIColor(hexString: "ffa34d")
    let primaryBarTitleColour: UIColor! = UIColor(hexString: "d4f8e8")
    
    let titleTextAttribute = [NSAttributedString.Key.foregroundColor: UIColor(hexString: "d4f8e8")]
    
    //button corner radius
    let buttonCornerRadius = 25.0
    
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
