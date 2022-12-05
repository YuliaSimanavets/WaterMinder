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
        
        let general = WaterMinderViewController()
        let history = HistoryViewController()
        let account = AccountViewController()
        let handbook = HandbookViewController()
        let setting = UINavigationController(rootViewController: SettingsViewController())
        
        self.setViewControllers([general, history, account, handbook, setting], animated: false)
       
        guard let items = tabBar.items else { return }
        
        let images = ["drop.fill", "chart.bar.fill", "person.2.fill", "book.fill","gearshape.fill"]
        
        for i in 0...4 {
            items[i].image = UIImage(systemName: images[i])
        }
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
    }
}
