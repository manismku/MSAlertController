//
//  MSAlertStackView.swift
//  MSAlertController
//
//  Created by manish kumar on 15/04/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

class MSAlertStackView: UIStackView {

    lazy var lblMessage: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    init(text: String, image: UIImage?) {
        super.init(frame: CGRect.zero)
        self.axis = UILayoutConstraintAxis.horizontal
        self.alignment = UIStackViewAlignment.fill
        self.distribution = UIStackViewDistribution.fillProportionally
        self.spacing = 5
        lblMessage.text = text
        imageView.image = image
        translatesAutoresizingMaskIntoConstraints = false
    }

    override func layoutSubviews() {
        addSubview(lblMessage)
        lblMessage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblMessage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class StackViewBuilder {
    
    private static var stackView: UIStackView = {
        let stview = UIStackView(frame: CGRect.zero)
        stview.axis = UILayoutConstraintAxis.vertical
        stview.alignment = UIStackViewAlignment.fill
        stview.distribution = UIStackViewDistribution.fillEqually
        stview.spacing = 20
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()

    static func makeStackView(models: [ViewModel]) -> UIStackView {
        for viewModel in models {
            stackView.addArrangedSubview(MSAlertStackView(text: viewModel.text, image: nil))
        }
        return stackView
    }
}
