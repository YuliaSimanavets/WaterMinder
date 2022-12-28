//
//  CustomTabBarController.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataManager = DataManager()
        let general = WaterMinderViewController()
        let history = HistoryViewController()
        let handbook = HandbookViewController()
        let setting = UINavigationController(rootViewController: SettingsViewController())
        
        history.setDataManager(dataManager)
        general.setDataManager(dataManager)
              
        self.setViewControllers([general, history, handbook, setting], animated: false)
       
        guard let items = tabBar.items else { return }
        
        let images = ["drop.fill", "chart.bar.fill", "book.fill","gearshape.fill"]
        
        for i in 0...3 {
            items[i].image = UIImage(systemName: images[i])
        }
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
    }
}
