//
//  MSAlertActionSheet.swift
//  MSAlertController
//
//  Created by manish kumar on 30/03/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

class MSAlertActionSheet: UIView {
    
    var actions: [(MSAlertAction)]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commontInit()
    }
    init(frame: CGRect, actions: [MSAlertAction]? = nil) {
        super.init(frame: frame)
        self.actions = actions
        commontInit()
    }
    
    deinit {
        print("MSAlertActionSheet is deleted")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commontInit()
    }
    
    func commontInit() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 154/255, green: 154/255, blue: 154/255, alpha: 0.75)
        layer.roundCorners(radius: 10)
        layer.masksToBounds = true
        addButtons()
    }
}

// MARK:- Add Buttons
extension MSAlertActionSheet {
    func addButtons() {
        if let actionable = actions {
            for (index, element) in actionable.enumerated() {
                let button = MSAlertButton(frame: CGRect.zero)
                layout(button: button, position: CGFloat(index))
                button.tag = index
                button.setTitle(element.title, for: .normal)
                button.addTarget(self, action: #selector(MSAlertActionSheet.actionHandler), for: .touchUpInside)
            }
        }
    }
    
    func layout(button: UIButton, position: CGFloat) {
        
        let margins = layoutMarginsGuide
        var line: UILabel?
        if position == 1 || position == 2 {
            line = UILabel(frame: CGRect.zero)
            line!.translatesAutoresizingMaskIntoConstraints = false
            line!.backgroundColor = UIColor.black
            line!.alpha = Constants.ViewAlpha.line
            addSubview(line!)
            line!.heightAnchor.constraint(equalToConstant: Constants.Layout.ActionSheetLinedHeight).isActive = true
            line!.leadingAnchor.constraint(equalTo: leadingAnchor, constant:0).isActive = true
            line!.trailingAnchor.constraint(equalTo: trailingAnchor, constant:0).isActive = true
            line!.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(position * Constants.Layout.ActionSheetRowHeight + Constants.Layout.ActionSheetRowPadding)).isActive = true
        }
        
        addSubview(button)
        button.heightAnchor.constraint(equalToConstant: Constants.Layout.ActionSheetRowHeight).isActive = true
        button.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        if let divider = line {
            button.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: CGFloat(Constants.Layout.ActionSheetRowPadding)).isActive = true
        } else {
            button.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(position * Constants.Layout.ActionSheetLinedHeight + Constants.Layout.ActionSheetRowPadding)).isActive = true
        }        
    }
    
    @objc func actionHandler(sender: UIButton) {
        if let actionable = actions {
               let action = actionable[sender.tag]
               action.perform()
        }
    }
}
