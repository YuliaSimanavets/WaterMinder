//
//  SaveWaterViewModel.swift
//  WaterMinder
//
//  Created by Yuliya on 13/12/2022.
//

import Foundation

class SaveWaterViewModel {
    
    private enum SettingsKeys: String {
        case liquidName
    }
    
    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.liquidName.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.liquidName.rawValue
            if let liquid = newValue {
                print("value: \(liquid) was added to key \(key)")
                defaults.set(liquid, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
