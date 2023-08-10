//
//  AssemblyModelBuilder.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation
import UIKit

protocol AssemblyBulderProtocol {
    func createMainModule() -> UINavigationController
    func createContactsModule() -> UIViewController
    func createProfileModule() -> UIViewController
    func createBasketModule() -> UIViewController
}

class AssemblyBulder: AssemblyBulderProtocol {

    // MARK: create main module
    
    func createMainModule() -> UINavigationController {
        
        let mainView = MenuViewController()
        let navigation = UINavigationController(rootViewController: mainView)
        
        navigation.navigationBar.isTranslucent = false
        navigation.view.backgroundColor = .white
        
        navigation.navigationBar.tintColor = .white
        let networkService = NetworkImplement()
//        let presenter = MenuPresenter(view: mainView, networkManager: networkService)
        let presenter2 = MainViewPresenter(view: mainView, networkManager: networkService)
        mainView.presenter = presenter2
        
        return navigation
    }
    
    func createContactsModule() -> UIViewController {
        let view = UIViewController()
        return view
    }
    
    func createProfileModule() -> UIViewController {
        let view = UIViewController()
        return view
    }
    
    func createBasketModule() -> UIViewController {
        let view = UIViewController()
        return view
    }
    
}
