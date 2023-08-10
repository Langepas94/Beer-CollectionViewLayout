//
//  MainCoordinator.swift
//  Pizza_mizza
//
//  Created by Артём Тюрморезов on 24.07.2023.
//

import Foundation
import UIKit

// MARK: - Main Coordinator Protocol
protocol Coordinator {
    var tabBarController: UITabBarController { get set }
    var assemblyBuilder: AssemblyBulderProtocol { get set }
    func start()
}

final class MainCoordinator: Coordinator {
    
    var tabBarController: UITabBarController
    
    var assemblyBuilder: AssemblyBulderProtocol
    
    // MARK: - Init
    
    init(tabBarController: UITabBarController, assemblyBuilder: AssemblyBulderProtocol) {
        self.tabBarController = tabBarController
        self.assemblyBuilder = assemblyBuilder
    }
    
    // MARK: - Start Coordinator
    
    func start() {
       setupTabBar()
        tabBarController.viewControllers = [createMainModule(), createContactsModule(), createProfileModule(), createBasketModule()]
    }
    
    // MARK: - Setup TabBar
    
    func setupTabBar() {
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .gray
        tabBarController.tabBar.tintColor = .systemPink
    }
    
    // MARK: - Module builders
    
    // MARK: - MainScreen
    
    func createMainModule() -> UINavigationController {
        
        let mainView = MenuViewController()
        let navigation = UINavigationController(rootViewController: mainView)
        
        navigation.navigationBar.isTranslucent = false
        navigation.view.backgroundColor = .white
        navigation.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "list.bullet.rectangle.portrait.fill"), tag: 0)
        navigation.navigationBar.tintColor = .white
        let networkService = NetworkImplement()
        let presenter = MenuPresenter(view: mainView, networkManager: networkService)

        mainView.presenter = presenter
        
        return navigation
    }
    
    // MARK: - Contacts
    
    func createContactsModule() -> UIViewController {
        let view = UIViewController()
        let error = ErrorMainScreen()
        error.frame = view.view.bounds
        view.tabBarItem = UITabBarItem(title: "Contacst", image: UIImage(systemName: "phone.fill"), tag: 1)
        view.view.addSubview(error)
        view.view.backgroundColor = .white
        return view
    }
    
    // MARK: - Profile
    
    func createProfileModule() -> UIViewController {
        let view = UIViewController()
        view.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 2)
        view.view.backgroundColor = .white
        return view
    }
    
    // MARK: - Basket
    
    func createBasketModule() -> UIViewController {
        let view = UIViewController()
        view.tabBarItem = UITabBarItem(title: "Basket", image: UIImage(systemName: "basket.fill"), tag: 3)
        view.view.backgroundColor = .white
        return view
    }
}
