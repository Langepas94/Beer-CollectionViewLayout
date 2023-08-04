//
//  SceneDelegate.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let tabBar = UITabBarController()
        let assemblyBuiler = AssemblyBulder()
        
        let coordinator = MainCoordinator(tabBarController: tabBar, assemblyBuilder: assemblyBuiler)
        coordinator.start()
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}

