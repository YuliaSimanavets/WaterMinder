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
