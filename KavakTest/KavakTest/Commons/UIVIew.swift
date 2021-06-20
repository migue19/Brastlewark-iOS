//
//  UIVIew.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//

import UIKit
extension UIView {
    func elevate(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = CGFloat(elevation)
        self.layer.shadowOpacity = 0.5
    }
}
