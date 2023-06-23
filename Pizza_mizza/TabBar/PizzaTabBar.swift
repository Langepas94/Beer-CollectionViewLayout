//
//  PizzaTabBar.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation
import UIKit

class PizzaTabBar: UITabBarController {
    
    
    let builder = AssemblyBulder()
    
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
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .systemPink
    }
    
    func setupControllers() {
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 0.3
        let mainScreen = builder.createMainModule()
        mainScreen.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        
        let contactScreen = builder.createContactsModule()
        contactScreen.tabBarItem.image = UIImage(systemName: "phone.fill")
        
        let profileScreen = builder.createProfileModule()
        profileScreen.tabBarItem.image = UIImage(systemName: "person.fill")
        
        let basketScreen = builder.createBasketModule()
        basketScreen.tabBarItem.image = UIImage(systemName: "basket.fill")
        
        setViewControllers([mainScreen, contactScreen, profileScreen, basketScreen], animated: true)
    }
}
