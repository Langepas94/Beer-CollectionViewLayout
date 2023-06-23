//
//  ItemModel.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

struct ItemModel: Decodable {
    var name: String?
    var description: String?
    var image_url: String?
    var ingredients: Ingredients?
    var abv: Double?
}

struct Ingredients: Decodable {
    var malt: [Malt]?
}

struct Malt: Decodable {
    var name: String?
    var amount: Amount?
}

struct Amount: Decodable {
    var value: Float?
    var unit: String?
}
