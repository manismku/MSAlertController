//
//  MSAlertSideview.swift
//  MSAlertController
//
//  Created by manish kumar on 28/02/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

class MSAlertSideview: UIView {
    
    var theme: Appearance
    init(frame: CGRect, theme: Appearance, view: UIView) {
        self.theme = theme
        super.init(frame: frame)
        self.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        if view is UILabel { // refactor to style
            view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        } else {
            view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }

        self.commontInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commontInit() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = theme.sideViewBgColor
        layer.roundCorners(radius: 10)
        layer.masksToBounds = true
    }

}
