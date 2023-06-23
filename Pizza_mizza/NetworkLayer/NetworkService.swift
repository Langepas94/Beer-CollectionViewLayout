//
//  NetworkService.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

enum NetworkErrors: Error {
    case invalidURL
    case noDataAvailable
    case dataCantDecoded
}

enum FetchType: String {
    case allBeers = "beers"

}

protocol NetworkService {
    static func baseURL() -> String
    func getAllBeers(completion: @escaping(Result<[ItemModel]?, NetworkErrors>) -> Void)
}
