//
//  MainModel.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

struct MainModel: MainModelProtocol {
    var userCity: String
    
    var headerImageName: String
    
    var categories: [String]
    
    var tableData: [MainTableCollectionModelProtocol]
    
}
