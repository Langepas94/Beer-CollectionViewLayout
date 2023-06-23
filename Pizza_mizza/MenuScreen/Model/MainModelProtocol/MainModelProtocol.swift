//
//  MainModelProtocol.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

protocol MainModelProtocol {
    var userCity: String { get set }
    var headerImageNames: [String] { get set }
    var categories: [String] { get set }
    var tableData: [ItemModel] { get set }
}
