//
//  MenuPresenter.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

class MenuPresenter: MenuPresenterProtocol {
    
    weak var view: MainViewProtocol?
    let networkManager: NetworkService
    let categs = BeerFilter()
    var mainData: MainModel? = MainModel(headerImageNames: ["banner1", "banner2", "banner3", "banner4", "banner5", "banner6"])

    func getData() {
       
        networkManager.getAllBeers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {

                    let filtered = self.categs.filterBeers(beers: data ?? [ItemModel]())

                    self.mainData?.tableData = filtered
                    self.mainData?.categories = self.categs.getCategories()
                    self.view?.dataLoaded()
                   
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func onTapCategory() {
        //
    }
    
    func setCategories() -> [String] {
        categs.getCategories()
    }
    
    required init(view: MainViewProtocol, networkManager: NetworkService) {
        self.networkManager = networkManager
        self.view = view
        getData()
    }
}
