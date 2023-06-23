//
//  Router.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

protocol RouterProtocol {
    var tabBar: PizzaTabBar? { get set }
    var assemblyBuilder: AssemblyBulderProtocol? { get set }

}

class Router: RouterProtocol {
    var tabBar: PizzaTabBar?
    
    var assemblyBuilder: AssemblyBulderProtocol?
    
    init(tabBar: PizzaTabBar, assemblyBuilder: AssemblyBulderProtocol ) {
        self.tabBar = tabBar
        self.assemblyBuilder = assemblyBuilder
    }
    
}
