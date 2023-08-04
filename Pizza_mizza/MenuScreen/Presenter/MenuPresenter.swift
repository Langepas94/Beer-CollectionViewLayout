//
//  MenuPresenter.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation
import RealmSwift

final class MenuPresenter: MenuPresenterProtocol {
    
    weak var view: MainViewProtocol?
    let networkManager: NetworkService
    let categs = BeerFilter()
    var mainData: MainModel? = MainModel(headerImageNames: ["banner1", "banner2", "banner3", "banner4", "banner5", "banner6"])
    var db: DataBaseProtocol = BeerDataBase()
    
    func getData() {
        networkManager.getAllBeers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async { [self] in
                    
                    let filtered = self.categs.filterBeers(beers: data ?? [ItemModel]())
                    self.mainData?.tableData = filtered
                    self.mainData?.categories = self.categs.getCategories()
                    self.view?.dataLoaded()
                    //                    self.db.saveToDb(filtered)
                    //                    print(self.db.getFromDb())
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: setup Tap here in future
    func onTapCategory() {
        //
    }
    
    func setCategories() -> [String] {
        categs.getCategories()
    }
    
    // MARK: Init
    
    required init(view: MainViewProtocol, networkManager: NetworkService) {
        self.networkManager = networkManager
        self.view = view
        getData()
    }
}
