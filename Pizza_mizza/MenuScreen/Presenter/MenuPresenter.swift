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
    var mainData: MainModel? = MainModel(userCity: "Moscow", headerImageNames: ["1", "2"], categories: ["1", "2", "3"], tableData: [ItemModel]())
    
    func getData() {
       
        networkManager.getAllBeers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.mainData?.tableData = data ?? [ItemModel]()
//                    print(self.mainData?.tableData)
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
    
    required init(view: MainViewProtocol, networkManager: NetworkService) {
        self.networkManager = networkManager
        self.view = view
        getData()
    }
}
