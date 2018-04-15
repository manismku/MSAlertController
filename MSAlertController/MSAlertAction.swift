//
//  MSAlertAction.swift
//  MSAlertController
//
//  Created by manish kumar on 30/03/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

public class MSAlertAction: NSObject {
    var title: String
    var handler: (() -> Void)?
    weak var vc: UIViewController?
    
    public init(title: String = "Ok", handler: (() -> Void)?) {
        self.title = title
        self.handler = handler
    }

    func perform() {
        if let viewController = vc {
            viewController.dismiss(animated: true) {
                [weak self] in
                if let weakSelf = self, let handle = weakSelf.handler {
                    handle()
                }
            }
        }
    }
}



