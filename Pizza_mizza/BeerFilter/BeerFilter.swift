//
//  BeerFilter.swift
//  Pizza_mizza
//
//  Created by Артём Тюрморезов on 24.07.2023.
//

import Foundation

final class BeerFilter {
    
    var filters: [(min: Double, max: Double, categoryName: String)] = [(0.0,3.0, "Light drunk"), (3.0001, 8.0, "Pre Medium drunk"),(8.0001, 15.0, "Medium drunk"), (15.0001, 35.0, "Post Medium drunk"), (35.0001, 100.0, "Hard Level drunk")]
    
    func filterBeers(beers: [ItemModel]) -> [BeerDataObject] {
        var filteredBeers = [BeerDataObject]()
        
        for beer in beers {
            
            if let abv = beer.abv {
                let category = filters.filter { low, upp, category in
                    abv >= low && abv <= upp
                    
                }
                
                filteredBeers.append(BeerDataObject(name: beer.name ?? "", description: beer.description ?? "", imageURL: beer.image_url ?? "", ingredients: nil, abv: beer.abv ?? 0, category: category.first?.categoryName ?? ""))
            }
            
        }

        return filteredBeers
    }
}
