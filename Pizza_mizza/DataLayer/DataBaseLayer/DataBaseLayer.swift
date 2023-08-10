//
//  DataBaseLayer.swift
//  Pizza_mizza
//
//  Created by Артём Тюрморезов on 02.08.2023.
//

import Foundation
import RealmSwift

class DataBaseLayer {
    
    let db: DataBaseProtocol
    let networkService: NetworkService
    let categs = BeerFilter()
    
    private func parseFromDb() -> [BeerDataObject] {
        db.getFromDb()
    }
    
    private func passToDb(_ objects: [BeerDataObject]) {
        db.saveToDb(objects)
    }
    
    func whichDataUsed(_ isNetworkConnected: Bool) {
        if isNetworkConnected {
            
        } else if !isNetworkConnected && db.emptyCheck() == false {
            
        } else if !isNetworkConnected && db.emptyCheck() == true {
            
        }
    }
    
//    private func getFromNetwork() -> [BeerDataObject] {
//
//        var array: [BeerDataObject] = []
//        networkService.getAllBeers { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let data):
//
//                DispatchQueue.main.async { [self] in
////                    print(NetworkChecker.shared.isConnected)
////                    let filtered = self.categs.filterBeers(beers: data ?? [ItemModel]())
////                    self.mainData?.tableData = filtered
////                    self.mainData?.categories = self.categs.getCategories()
////                    self.view?.dataLoaded()
//                    //                    self.db.saveToDb(filtered)
//                    //                    print(self.db.getFromDb())
//                    let filtered = self.categs.filterBeers(beers: data!)
//                    array = filtered
//
//                }
//            case .failure(let error):
//
//                print(error)
////                return array
//            }
//        }
//
//        return array
//    }
    
    init(db: DataBaseProtocol, networkService: NetworkService) {
        self.db = db
        self.networkService = networkService
    }
}
