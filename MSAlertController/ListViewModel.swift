//
//  Protocols.swift
//  MSAlertController
//
//  Created by manish kumar on 15/04/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation
protocol ViewModel {
    var text: String {get set}
    var imageURL: URL? {get set}
}

struct ListModel: ViewModel {
    var text: String
    var imageURL: URL?

    init?(message: String, url: URL?) {
        guard !message.isEmpty else {
            return nil
        }
        self.text = message
        self.imageURL = url
    }
}
