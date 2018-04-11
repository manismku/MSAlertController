//
//  MSAlertConstant.swift
//  MSAlertController
//
//  Created by manish kumar on 15/03/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

typealias AnimationBlock = ()->Void

public enum MSAlertControllerStyle {
    case MSAlertControllerStyleDefault
    case MSAlertControllerStyleShowMoreList
    case MSAlertControllerStyleShowMoreGrid
    case MSAlertControllerStyleSlideView
}

struct Constants {
     struct Device {
        static var DeviceHeight: CGFloat {
            struct Singleton {
                static let height = max(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
            }
            return Singleton.height
        }
        static var DeviceWidth: CGFloat {
            struct Singleton {
                static let width = min(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
            }
            return Singleton.width
        }
    }
    
    struct Layout {
        static let Zero: CGFloat = 0
        static let AlertViewTop: CGFloat = 100
        static let AlertViewHeight: CGFloat = 100
        static let SideViewInitialWidth: CGFloat = 0
        static let SideViewMaxWidth: CGFloat = 130
        static let AlertViewMaxLeft: CGFloat = -(SideViewMaxWidth + 5)
        static let AlertViewRight: CGFloat = -(SideViewMaxWidth + 5)
        static let AlertViewHeaderHeight: CGFloat = 40
        static let CancelButtonBottom: CGFloat = 85
        static let CancelButtonHeight: CGFloat = 25
        static let CancelButtonWidth: CGFloat = 25
        static let ActionSheetTop: CGFloat = 10
        static let ActionSheetRowHeight: CGFloat = 50
        static let ActionSheetRowPadding: CGFloat = 5
        static let ActionSheetLinedHeight: CGFloat = 0.5
    }
    
    struct ViewAlpha {
        static let line: CGFloat = 0.75
        static let max: CGFloat = 1
        static let min: CGFloat = 0
    }
}


public struct Appearance {
    public var bgColor: UIColor
    public var headerBgColor: UIColor
    public var titleColor: UIColor
    public var bodyTextColor: UIColor
    public var sideViewBgColor: UIColor
    public var windowHeight: CGFloat
    public var bodyFont: UIFont?
    public var titleFont: UIFont?

    public init() {
        self.bgColor = UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 1.0)
        self.headerBgColor = UIColor(red: 223/255, green: 198/255, blue: 204/255, alpha: 1)
        self.titleColor = UIColor(red: 168/255, green: 57/255, blue: 57/255, alpha: 1.0)
        self.bodyTextColor = UIColor(red: 168/255, green: 57/255, blue: 57/255, alpha: 1.0)
        self.sideViewBgColor = UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 0.75)
        self.windowHeight = 120
        self.bodyFont = UIFont(name: "HelveticaNeue", size: 14)
        self.titleFont = UIFont(name: "HelveticaNeue", size: 12)
    }
}


