//
//  MSAlertAction.swift
//  MSAlertController
//
//  Created by manish kumar on 30/03/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

public class MSAlertAction: NSObject {
    var title: String?
    var handler: (() -> Void)?
    
    public init(title: String? = nil, handler: (() -> Void)? = nil) {
        self.title = title
        self.handler = handler
    }
    
    deinit {
        print("Alert action is deleted")
    }
    
}



