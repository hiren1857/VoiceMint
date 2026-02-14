//
//  Helper.swift
//  VoiceMint
//
//  Created by test on 29/08/25.
//

import Foundation
import UIKit

extension UIViewController {
    
        
    class func btnDropShadow(views : [UIView]) {
        for view in views {
            view.applyShadow()
        }
    }
    
    func IpadorIphone(value:Double) -> Double {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return ((value / 2) * 3)
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            return value
        } else {
            return value
        }
    }
}

extension UIView {
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offSet
      layer.shadowRadius = radius

      layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
        func applyShadow(
            color: UIColor = UIColor.label,//UIColor(red: 223/255, green: 228/255, blue: 238/255, alpha: 1.0),
            opacity: Float = 0.1,
            offset: CGSize = CGSize(width: 0, height: 2),
            radius: CGFloat = 4
        ) {
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOpacity = opacity
            self.layer.shadowOffset = offset
            self.layer.shadowRadius = radius
            self.layer.masksToBounds = false
        }
}

extension UISegmentedControl {
    func setFontSize(fontSize: CGFloat) {
        guard let avenirFont = UIFont(name: "AvenirNext-Medium", size: fontSize) else {
            print("⚠️ Font 'AvenirNext-DemiBold' not found.")
            return
        }

        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label,
            .font: avenirFont
        ]

        let boldTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: avenirFont
        ]

        self.setTitleTextAttributes(normalTextAttributes, for: .normal)
        self.setTitleTextAttributes(normalTextAttributes, for: .highlighted)
        self.setTitleTextAttributes(boldTextAttributes, for: .selected)
    }
}
