//
//  BeerDataObject.swift
//  Pizza_mizza
//
//  Created by Артём Тюрморезов on 24.07.2023.
//

import Foundation

struct BeerDataObject: Codable, Hashable {
    var id = UUID()
    var name: String?
    var description: String?
    var imageURL: String?

    var abv: Double?
    var category: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: BeerDataObject, rhs: BeerDataObject) -> Bool {
        return lhs.id == rhs.id
    }
}
