//
//  MenuPresenterProtocol.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func tappedOnCategories()
    func dataLoaded()
}

protocol MenuPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkManager: NetworkService)
    var view: MainViewProtocol? { get set }
    func getData()
    func onTapCategory()
    var mainData: MainModel? { get set }
}
