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
    func emptyCheck() -> Bool
}




