//
//  MSAlertConstant.swift
//  MSAlertController
//
//  Created by manish kumar on 15/03/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

typealias AnimationBlock = () -> Void

public enum MSAlertStyle {
    case Default
    case NoAction
    case List
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

