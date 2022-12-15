//
//  DataManager.swift
//  WaterMinder
//
//  Created by Yuliya on 14/12/2022.
//

import UIKit

extension WaterMinderViewController {
    
    func addData(_ data: LiquidTypeModel) {
        
// при нажатии кнопки -> добавляется item(LiquidTypeModel) в arrayLogs
        var arrayLogs = [LiquidTypeModel]()
        arrayLogs.append(data)
    }
}

extension HistoryViewController {
    
    func getData() {
    
    
    }
    
}

//class DataManager {
//
//    private var arrayLogs = [LiquidTypeModel]()
//
//    func addData(_ data: LiquidTypeModel) {
//       arrayLogs.append(data)
//
//    }
//
//    func getData() {
//
//
//    }
//
//}
