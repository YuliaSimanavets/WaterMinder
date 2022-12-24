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
    
    var typeModel: HistoryCollectionViewModel {
        switch self {
        case .water:
            return HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"),
                                              liquidTypeText: "Water",
                                              loginTime: Date())
        case .coffee:
            return HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"),
                                             liquidTypeText: "Coffee",
                                             loginTime: Date())
        case .tea:
            return HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"),
                                             liquidTypeText: "Tea",
                                             loginTime: Date())
            
//  можешь подсказать, как можно поместить "date" из LiquidModel в "loginTime: " ?
        }
    }
}

struct LiquidModel {
    
    let date: Date
    let type: LiquidType
    
}
