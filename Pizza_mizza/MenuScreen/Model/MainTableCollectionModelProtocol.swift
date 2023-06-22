//
//  MainTableCollectionModelProtocol.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

protocol MainTableCollectionModelProtocol {
    var title: String { get set }
    var description: String { get set }
    var price: String { get set }
    var itemImageName: String { get set }
}
