//
//  String+Extension.swift
//  MSAlertController
//
//  Created by manish kumar on 10/04/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation


extension String {    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
