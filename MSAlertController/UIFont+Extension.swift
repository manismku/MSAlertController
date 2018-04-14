//
//  UIFont+Extension.swift
//  MSAlertController
//
//  Created by manish kumar on 13/04/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation
private enum FontFamily: String {
    case sanFranciscoTextRegular = "SanFranciscoText-Regular"
    case sanFranciscoTextMedium = "SanFranciscoText-Medium"
    case sanFranciscoTextSemibold = "SanFranciscoText-Semibold"
    case sanFranciscoTextBlack = "SanFranciscoText-Bold"
    case sanFranciscoTextLight = "SanFranciscoText-Light"
}

enum FontStyle {
    case regular
    case medium
    case bold
    case black
    case light
}

//MARK:- UIFont extension
extension UIFont {

    //MARK: - Load framework Fonts
    public static let loadAllFonts: () = {
        registerFontWith(filenameString: "SanFranciscoText-Regular.otf", bundleIdentifierString: "Fonts")
        registerFontWith(filenameString: "SanFranciscoText-Medium.otf", bundleIdentifierString: "Fonts")
        registerFontWith(filenameString: "SanFranciscoText-Semibold.otf", bundleIdentifierString: "Fonts")
        registerFontWith(filenameString: "SanFranciscoText-Bold.otf", bundleIdentifierString: "Fonts")
        registerFontWith(filenameString: "SanFranciscoText-Light.otf", bundleIdentifierString: "Fonts")
    }()

    //MARK: - Make Font bundle register with framework
    static func registerFontWith(filenameString: String, bundleIdentifierString: String) {
        let frameworkBundle = Bundle(for: MSAlertController.self)
        let resourceBundleURL = frameworkBundle.url(forResource: bundleIdentifierString, withExtension: "bundle")
        if let url = resourceBundleURL, let bundle = Bundle(url: url) {
            let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil)
            if let fontData = NSData(contentsOfFile: pathForResourceString!), let dataProvider = CGDataProvider.init(data: fontData) {
                let fontRef = CGFont.init(dataProvider)
                var errorRef: Unmanaged<CFError>? = nil
                if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
                    print("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
                }
            }
        }
        else {
            print("Failed to register font - bundle identifier invalid.")
        }
    }

    //MARK: - SanFrancisco font
    class func sanFranciscoText(style: FontStyle, size: CGFloat) -> UIFont {
        var font: UIFont?
        switch style {
        case .regular:
            font = UIFont(name: FontFamily.sanFranciscoTextRegular.rawValue, size: size)
        case .medium:
            font = UIFont(name: FontFamily.sanFranciscoTextMedium.rawValue, size: size)
        case .bold:
            font = UIFont(name: FontFamily.sanFranciscoTextSemibold.rawValue, size: size)
        case .black:
            font = UIFont(name: FontFamily.sanFranciscoTextBlack.rawValue, size: size)
        case .light:
            font = UIFont(name: FontFamily.sanFranciscoTextLight.rawValue, size: size)
        }
        assert(font != nil, "Unable to load font, SanFranciscoText \(style) font not included in the bundle!")
        return font!
    }

}
