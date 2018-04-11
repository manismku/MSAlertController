//
//  Extensions.swift
//  MSAlert
//
//  Created by manish kumar on 26/02/18.
//  Copyright © 2018 manish kumar. All rights reserved.
//

import Foundation


extension CALayer {
    
    func roundCorners(radius: CGFloat) {
        self.cornerRadius = radius
    }
        
    func addShadow() {
        self.shadowOffset = .zero
        self.shadowOpacity = 0.2
        self.shadowRadius = 10
        self.shadowColor = UIColor.black.cgColor
        self.masksToBounds = false
    }

}
