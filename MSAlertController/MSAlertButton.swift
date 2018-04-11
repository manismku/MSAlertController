//
//  MSAlertButton.swift
//  MSAlertController
//
//  Created by manish kumar on 30/03/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import UIKit

class MSAlertButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commontInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commontInit()
    }
    
    deinit {
        print("MSAlertButton is deleted")
    }
    
    func commontInit() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        alpha = 0.75
        setTitleColor(UIColor.black, for: .normal)
        titleLabel?.font =   UIFont(name: "HelveticaNeue", size: 25)
    }
}
