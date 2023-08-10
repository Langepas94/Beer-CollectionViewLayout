//
//  BeerDataBase.swift
//  Pizza_mizza
//
//  Created by Артём Тюрморезов on 10.08.2023.
//

import Foundation
import RealmSwift

final class BeerDataBase: DataBaseProtocol {
    
    let db = try! Realm()
    
    var lastUpdateTime: Date?
    
    // Protocol implements
    
    func saveToDb(_ data: [BeerDataObject]) {
        let currentTime = Date()
        if let lastUpdateTime = lastUpdateTime, currentTime.timeIntervalSince(lastUpdateTime) > 3600 {
            var newObjects = data.map { beer in
                BeerDataBaseObject(name: beer.name, descript: beer.description, imageURL: beer.imageURL, abv: beer.abv, category: beer.category)
            }
            
            if !db.isEmpty {
                
                var filtered = db.objects(BeerDataBaseObject.self).filter { dbObject in
                    newObjects.contains { beer in
                        beer.name == dbObject.name
                    }
                }
                if filtered.count == 0 {
                    try! db.write({
                        db.add(newObjects)
                    })
                } else {
                    try! db.write({
                        filtered.map { beerObject in
                            newObjects.map { beer in
                                beerObject.imageURL = beer.imageURL
                                beerObject.descript = beer.descript
                                beerObject.category = beer.category
                                beerObject.abv = beer.abv
                            }
                        }
                    })
                }
                
            } else {
                data.forEach({ object in
                    let data = BeerDataBaseObject(name: object.name, descript: object.description, imageURL: object.imageURL, abv: object.abv, category: object.category)
                    
                    try! db.write({
                        
                        db.add(data, update: .modified)
                    })
                })
            }
        }
    }
    
    func getFromDb() -> [BeerDataObject] {
        let allObjects = db.objects(BeerDataBaseObject.self)
        var array = [BeerDataObject]()
       allObjects.forEach { object in
            let data = BeerDataObject(id: object.id ?? UUID(), name: object.name, description: object.description, imageURL: object.imageURL, abv: object.abv, category: object.category)
           array.append(data)
        }
        return array
    }
    
    func emptyCheck() -> Bool {
        db.isEmpty
    }
}

// MARK: - Data Object

final class BeerDataBaseObject: Object {
    @Persisted var id: UUID?
    @Persisted var name: String?
    @Persisted var descript: String?
    @Persisted var imageURL: String?
    @Persisted var abv: Double?
    @Persisted var category: String?
    
    convenience init(name: String? = nil, descript: String? = nil, imageURL: String? = nil, abv: Double? = nil, category: String? = nil) {
        self.init()
        self.name = name
        self.descript = descript
        self.imageURL = imageURL
        self.abv = abv
        self.category = category
    }
}
