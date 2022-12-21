//
//  DataManager.swift
//  WaterMinder
//
//  Created by Yuliya on 14/12/2022.
//

import UIKit

class DataManager {

    private var arrayLogs = [LiquidModel]()

    func addData(_ data: LiquidModel) {
       arrayLogs.append(data)
    }

    func getData() -> [LiquidModel] {
        
        return arrayLogs
    }

}
