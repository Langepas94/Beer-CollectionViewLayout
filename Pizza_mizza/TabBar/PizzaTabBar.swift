//
//  PizzaTabBar.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation
import UIKit

class PizzaTabBar: UITabBarController {
    
    let mainScreen = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupControllers()
    }
    
}
// MARK: - Setup extension
extension PizzaTabBar {
    
    func setupAppearance() {
        tabBar.backgroundColor = .white
        
    }
    
    func setupControllers() {
        mainScreen.tabBarItem.image = UIImage(systemName: "basket.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        setViewControllers([mainScreen], animated: true)
    }
}
