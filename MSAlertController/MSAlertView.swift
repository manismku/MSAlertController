    //
//  MSAlertView.swift
//  MSAlert
//
//  Created by manish kumar on 26/02/18.
//  Copyright © 2018 manish kumar. All rights reserved.
//

import UIKit

class MSAlertView: UIView {
    
    var title: String
    var theme: Appearance
    lazy var headerView: UIView = {
        let view  = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textIndicator: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor(red: 168/255, green: 57/255, blue: 57/255, alpha: 1.0)
        label.text = "Slide for more"
        label.font = UIFont(name: "HelveticaNeue", size: 10)
        return label
    }()
    
    var lblBottomHeight: CGFloat {
        return "Slide for more".height(withConstrainedWidth: 100, font: (UIFont(name: "HelveticaNeue", size: 10))!)
    }
    
    lazy var textBody: UITextView = {
       let txtView = UITextView(frame: CGRect.zero)
        txtView.translatesAutoresizingMaskIntoConstraints = false
        txtView.backgroundColor = UIColor.clear
        txtView.isEditable = false
        txtView.isSelectable = false
        txtView.textAlignment = .left
        txtView.textContainerInset = UIEdgeInsets.zero
        txtView.textContainer.lineFragmentPadding = 0;
        txtView.textContainer.lineBreakMode = .byTruncatingTail
        txtView.textContainer.maximumNumberOfLines = 7
        
       return txtView
    }()
    
    init(frame: CGRect, title: String, appearance: Appearance) {
        self.title = title
        self.theme = appearance
        super.init(frame: frame)
        commontInit()
        textBody.font = appearance.bodyFont
        textBody.text = title
        headerView.backgroundColor = appearance.headerBgColor
        headerTitle.font = appearance.titleFont
        headerTitle.textColor = appearance.titleColor
        backgroundColor = appearance.bgColor
    }
    
    deinit {
        print("Alertview  deleted")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commontInit() {
        translatesAutoresizingMaskIntoConstraints = false
        headerTitle.text = title.uppercased()
        layer.roundCorners(radius: 10)
        layer.masksToBounds = true
        layout()
    }


    func layout() {
    
        let margins = layoutMarginsGuide
        
        // customize header
        headerView.addSubview(headerTitle)
        headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5).isActive = true
        headerTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        
        addSubview(headerView)
        headerView.heightAnchor.constraint(equalToConstant: Constants.Layout.AlertViewHeaderHeight).isActive = true
        headerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        addSubview(textBody)
        textBody.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 5).isActive = true
        textBody.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textBody.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 10).isActive = true
        textBody.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 10).isActive = true

        addSubview(textIndicator)
        textIndicator.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textIndicator.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        //textIndicator.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    }
    
    
}
