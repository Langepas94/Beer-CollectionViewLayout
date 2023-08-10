//
//  MainViewPresenter.swift
//  Pizza_mizza
//
//  Created by Артём Тюрморезов on 10.08.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setData()
    func setNoInternetAvailable()
    func startLoading()
    func endLoading()
}

protocol ViewPresenterProtocol {
    init(view: MainViewProtocol, networkManager: NetworkService)
//    var handleError: Bool { get set }
    var mainData: MainModel? { get set }
    func getData()
    func setCategories() -> [String]
}

class MainViewPresenter: ViewPresenterProtocol {
    
    unowned let view: MainViewProtocol
    var mainData: MainModel? = MainModel(headerImageNames: ["banner1", "banner2", "banner3", "banner4", "banner5", "banner6"])
    let networkManager: NetworkService
    var db: DataBaseProtocol = BeerDataBase()
//    var handleError: Bool = false
    let categs = BeerFilter()
    
    required init(view: MainViewProtocol, networkManager: NetworkService) {
        self.view = view
//        self.mainData = mainData as? MainModel
        self.networkManager = networkManager
        getData()
    }
    
    func getData() {
        self.view.startLoading()
        if NetworkChecker.shared.isConnected {
            networkData()
            
        } else if !NetworkChecker.shared.isConnected && db.emptyCheck() == false {
            dbOfflineData()
            self.view.endLoading()
        } else if !NetworkChecker.shared.isConnected && db.emptyCheck() == true {
//            handleError.toggle()
            self.view.setNoInternetAvailable()
            self.view.endLoading()
        }
    }
    
    private func dbOfflineData() {
        
        let data = db.getFromDb()
        self.mainData?.tableData = data
        self.mainData?.categories = self.categs.getCategories()
        
    }
    
    private func networkData() {
        networkManager.getAllBeers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async { [self] in
                    print(NetworkChecker.shared.isConnected)
                    let filtered = self.categs.filterBeers(beers: data ?? [ItemModel]())
                    self.mainData?.tableData = filtered
                    self.mainData?.categories = self.categs.getCategories()
                    self.view.setData()
                    self.view.endLoading()
                    self.db.saveToDb(filtered)
                }
            case .failure(let error):
                if db.emptyCheck() {
                    self.view.setNoInternetAvailable()
                }
                print(error)
            }
        }
    }
    
    func setCategories() -> [String] {
        categs.getCategories()
    }
}
