//
//  LiquidType.swift
//  WaterMinder
//
//  Created by Yuliya on 15/12/2022.
//

import Foundation
import UIKit

enum LiquidType: Codable {
    
    case water
    case coffee
    case tea
    
    var image: UIImage {
        switch self {
        case .water:
            return UIImage(named: "water")!
        case .coffee:
            return UIImage(named: "сoffee")!
        case .tea:
            return UIImage(named: "tea")!
        }
    }
    
    var title: String {
        switch self {
        case .water:
            return "Water"
        case .coffee:
            return "Coffee"
        case .tea:
            return "Tea"
        }
    }
}

struct LiquidModel: Codable {
    
    let date: Date
    let type: LiquidType
}
