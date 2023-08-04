//
//  NetworkImplement.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

final class NetworkImplement: NetworkService {
    static func baseURL() -> String {
        return "https://api.punkapi.com"
    }
    
    func getAllBeers(completion: @escaping (Result<[ItemModel]?, NetworkErrors>) -> Void) {
        
        let queryParams = [URLQueryItem(name: "per_page", value: "80")]
        var components = URLComponents(string: NetworkImplement.baseURL())
        components?.path = "/v2/" + FetchType.allBeers.rawValue
        components?.queryItems = queryParams
        
        guard let url = components?.url else {
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
