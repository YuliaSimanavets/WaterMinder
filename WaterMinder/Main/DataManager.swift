//
//  DataManager.swift
//  WaterMinder
//
//  Created by Yuliya on 14/12/2022.
//

import UIKit

class DataManager {
        
    init() {
        if let myData = defaults.data(forKey: UserDefaultKeys.liquid.rawValue) {
            arrayLogs = (try? JSONDecoder().decode([LiquidModel].self, from: myData)) ?? []
        }
    }
    
    private enum UserDefaultKeys: String {
           case liquid
       }

    enum TimeInterval {
        case day
        case week
        case month
        case year
    }
   
    private var arrayLogs = [LiquidModel]()
    private let defaults = UserDefaults.standard
    
    func addData(_ data: LiquidModel) {
        
        arrayLogs.append(data)
        
        let dataJSON = try? JSONEncoder().encode(arrayLogs)
        defaults.set(dataJSON, forKey: UserDefaultKeys.liquid.rawValue)
    }

    func getData() -> [LiquidModel] {
   
        return arrayLogs
    }
      
    func getData(_ data: TimeInterval) -> [LiquidModel] {
        
        let countSecInDay: Double = 3600 * 24
             
        switch data {
        case .day:
            return arrayLogs.filter { abs($0.date.timeIntervalSinceNow) <=  countSecInDay }
        case .week:
            return arrayLogs.filter { abs($0.date.timeIntervalSinceNow) <=  countSecInDay * 7 }
        case .month:
            return arrayLogs.filter { abs($0.date.timeIntervalSinceNow) <=  countSecInDay * 30 }
        case .year:
            return arrayLogs.filter { abs($0.date.timeIntervalSinceNow) <=  countSecInDay * 365 }
        }
    }
}
