//
//  SettingsModel.swift
//  WaterMinder
//
//  Created by Yuliya on 09/12/2022.
//

import Foundation
import UIKit

enum SettingsModel {
    
    case cups(SettingsHeaderTitleViewModel)
//    case horizCollection
    case otherDrinks(SettingsImageWithTitleViewModel)
    
    case appearance(SettingsHeaderTitleViewModel)
    case theme(SettingsImageWithTitleViewModel)
    case appIcon(SettingsImageWithTitleViewModel)
    case homeScreen(SettingsImageWithTitleViewModel)
    case appleWatch(SettingsImageWithTitleViewModel)
    case sharing(SettingsImageWithTitleViewModel)
    
    case general(SettingsHeaderTitleViewModel)
    case siriShortcuts(SettingsImageWithTitleViewModel)

    
    var showSwitch: Bool {
        switch self {
        case .sharing:
            return true
        default:
            return false
        }
    }
}
