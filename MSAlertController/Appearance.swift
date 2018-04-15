//
//  Appearance.swift
//  MSAlertController
//
//  Created by manish kumar on 13/04/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation
public struct Appearance {
    public var bgColor: UIColor
    public var headerBgColor: UIColor
    public var titleColor: UIColor
    public var bodyTextColor: UIColor
    public var sideViewBgColor: UIColor
    public var sideViewLabelFont: UIFont?
    public var windowHeight: CGFloat
    public var bodyFont: UIFont?
    public var titleFont: UIFont?
    public var titleAllignment: TitleAlignment

    public enum Theme {
        case light
        case grey
    }

    public enum TitleAlignment {
        case left
        case centre
    }

    public init() {
        self.bgColor = UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 1.0)
        self.headerBgColor = UIColor(red: 223/255, green: 198/255, blue: 204/255, alpha: 1)
        self.titleColor = UIColor(red: 168/255, green: 57/255, blue: 57/255, alpha: 1.0)
        self.bodyTextColor = UIColor(red: 168/255, green: 57/255, blue: 57/255, alpha: 1.0)
        self.sideViewBgColor = UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 0.75)
        self.windowHeight = 120
        self.bodyFont = UIFont.sanFranciscoText(style: .medium, size: 14)
        self.titleFont = UIFont.sanFranciscoText(style: .bold, size: 12)
        self.sideViewLabelFont = UIFont.sanFranciscoText(style: .medium, size: 20)
        self.titleAllignment = .left
    }

    static func lightTheme() -> Appearance {
        var theme =  Appearance()
        theme.bgColor = UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 1.0)
        theme.headerBgColor = UIColor(red: 223/255, green: 198/255, blue: 204/255, alpha: 1)
        theme.titleColor = UIColor(red: 168/255, green: 57/255, blue: 57/255, alpha: 1.0)
        theme.bodyTextColor = UIColor(red: 168/255, green: 57/255, blue: 57/255, alpha: 1.0)
        theme.sideViewBgColor = UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 0.75)
        theme.windowHeight = 120
        theme.bodyFont = UIFont.sanFranciscoText(style: .medium, size: 20)
        theme.titleFont = UIFont.sanFranciscoText(style: .bold, size: 12)
        theme.sideViewLabelFont = UIFont.sanFranciscoText(style: .medium, size: 20)
        return theme
    }

    static func greyTheme() -> Appearance {
        var theme =  Appearance()
        theme.bgColor = UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 0.75)
        theme.headerBgColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        theme.titleColor = UIColor(red: 65/255, green: 69/255, blue: 80/255, alpha: 1)
        theme.bodyTextColor = UIColor(red: 9/255, green: 10/255, blue: 10/255, alpha: 1)
        theme.sideViewBgColor = UIColor(red: 250/255, green: 250/255, blue: 254/255, alpha: 0.75)
        theme.windowHeight = 120
        theme.bodyFont = UIFont.sanFranciscoText(style: .medium, size: 14)
        theme.titleFont = UIFont.sanFranciscoText(style: .bold, size: 16)
        theme.sideViewLabelFont = UIFont.sanFranciscoText(style: .medium, size: 20)
        return theme
    }

    // Apperance factory
    public static func createTheme(theme: Theme) -> Appearance {
        var appearance: Appearance!
        switch theme {
            case .grey: appearance =  greyTheme()
            case .light: appearance =  lightTheme()
        }
        return appearance
    }
}
