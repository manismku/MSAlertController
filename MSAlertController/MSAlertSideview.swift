//
//  MSAlertSideview.swift
//  MSAlertController
//
//  Created by manish kumar on 28/02/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

class MSAlertSideview: UIView {
    
    private var viewLabel: UILabel!
    var theme: Appearance
    
    func createLabel() -> UILabel {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "View"
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        return label
    }
    
    init(frame: CGRect, theme: Appearance) {
        self.theme = theme
        super.init(frame: frame)
        self.alpha = 0
        DispatchQueue.main.async {
            [weak self] in
            self?.viewLabel = self?.createLabel()
            self?.commontInit()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commontInit() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = theme.sideViewBgColor
        layer.roundCorners(radius: 10)
        layer.masksToBounds = true
        
        addSubview(viewLabel)
        viewLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }

}
