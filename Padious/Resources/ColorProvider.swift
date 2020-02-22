//
//  ColorProvider.swift
//  Padious
//
//  Created by Tomas Skypala on 22/02/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import UIKit

struct AppTheme: ColorProviding {

    enum UserInterfaceStyle {
        case light
        case dark

        private static let lightAppColor = AppColor(
            primaryColor: ThemeColor.brownLight,
            secondaryColor: ThemeColor.negativeLightGrey,
            backgroundColor: ThemeColor.brownLightest
        )

        private static let darkAppColor = AppColor(
            primaryColor: ThemeColor.brownDark,
            secondaryColor: ThemeColor.negativeDarkGrey,
            backgroundColor: ThemeColor.brownLight
        )

        var appColor: AppColorProtocol {
            switch self {
                case .dark:     return Self.darkAppColor
                case .light:    return Self.lightAppColor
            }
        }
    }

    func getAppColorFor(_ traitCollection: UITraitCollection) -> AppColorProtocol {
        switch traitCollection.userInterfaceStyle {
            case .dark:                 return UserInterfaceStyle.dark.appColor
            case .light, .unspecified:  return UserInterfaceStyle.light.appColor
            @unknown default:           return UserInterfaceStyle.light.appColor
        }
    }

}

struct AppColor: AppColorProtocol {

    var primaryColor: UIColor
    var secondaryColor: UIColor

    var backgroundColor: UIColor

}

enum ThemeColor {

    static let brownDark = UIColor(red: 62 / 255, green: 39 / 255, blue: 35 / 255, alpha: 1)
    static let brownLight = UIColor(red: 93 / 255, green: 64 / 255, blue: 55 / 255, alpha: 1)

    static let brownLightest = UIColor(red: 239 / 255, green: 235 / 255, blue: 233 / 255, alpha: 1)

    static let positiveGreen = UIColor(red: 76 / 255, green: 175 / 255, blue: 80 / 255, alpha: 1)

    static let negativeLightGrey = UIColor(white: 189 / 255, alpha: 1)
    static let negativeDarkGrey = UIColor(white: 97 / 255, alpha: 1)

    static let negativeRed = UIColor(red: 183 / 255, green: 28 / 255, blue: 28 / 255, alpha: 1)
}
