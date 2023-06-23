//
//  NetworkImplement.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

class NetworkImplement: NetworkService {
    static func baseURL() -> String {
        "https://api.punkapi.com/v2/"
    }
    
    func getAllBeers(completion: @escaping (Result<[ItemModel]?, NetworkErrors>) -> Void) {
        let urlString = URL(string: NetworkImplement.baseURL() + FetchType.allBeers.rawValue)
        
        guard let url = urlString else {
            print(NetworkErrors.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else  {
                completion(.failure(NetworkErrors.noDataAvailable))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([ItemModel].self, from: data)
                
                completion(.success(decodedData))
                
            } catch {
                completion(.failure(NetworkErrors.dataCantDecoded))
            }
            
        }
        
        task.resume()
        
        
        
    }
}
