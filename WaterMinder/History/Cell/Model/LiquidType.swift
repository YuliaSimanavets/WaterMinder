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
}

struct LiquidModel {
    
    let date: Date
    let type: LiquidType
}
