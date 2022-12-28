//
//  LiquidType.swift
//  WaterMinder
//
//  Created by Yuliya on 15/12/2022.
//

import Foundation
import UIKit

enum LiquidType {
    
    case water
    case coffee
    case tea
    
    var image: UIImage {
        switch self {
        case .water:
            return UIImage(systemName: "cup.and.saucer")!
        case .coffee:
            return UIImage(systemName: "cup.and.saucer")!
        case .tea:
            return UIImage(systemName: "cup.and.saucer")!
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

struct LiquidModel {
    
    let date: Date
    let type: LiquidType
    
}
