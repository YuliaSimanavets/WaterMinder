//
//  SceneDelegate.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let tabBarController = CustomTabBarController()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

class CustomTabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let general = ViewController()
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

