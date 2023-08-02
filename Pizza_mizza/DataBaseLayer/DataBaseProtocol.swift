//
//  DataBaseProtocol.swift
//  Pizza_mizza
//
//  Created by Артём Тюрморезов on 02.08.2023.
//

import Foundation
import RealmSwift

protocol DataBaseProtocol {
    func saveToDb(_ data: [BeerDataObject])
    func getFromDb() -> [BeerDataObject]
}

class BeerDataBaseObject: Object {
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

class BeerDataBase: DataBaseProtocol {
    
    let db = try! Realm()
    
    func saveToDb(_ data: [BeerDataObject]) {
        data.forEach({ object in
            let data = BeerDataBaseObject(name: object.name, descript: object.description, imageURL: object.imageURL, abv: object.abv, category: object.category)
            
            try! db.write({
                db.add(data)
            })
            
        })
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
    
    
}
