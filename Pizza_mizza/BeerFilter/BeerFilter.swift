//
//  BeerFilter.swift
//  Pizza_mizza
//
//  Created by Артём Тюрморезов on 24.07.2023.
//

import Foundation

final class BeerFilter {
    
    private var filters: [(min: Double, max: Double, categoryName: String)] = [(0.0,5.0, "Classic Beer"), (5.0001, 7.0, "Nice drunk"),(7.0001, 10.0, "Highest"), (10.0001, 12.0, "Post Highest"), (12.0001, 100.0, "Drunken")]
    
    func filterBeers(beers: [ItemModel]) -> [BeerDataObject] {
        var filteredBeers = [BeerDataObject]()
        
        for beer in beers {
            
            if let abv = beer.abv {
                let category = filters.filter { low, upp, category in
                    abv >= low && abv <= upp
                    
                }
                
                filteredBeers.append(BeerDataObject(name: beer.name ?? "", description: beer.description ?? "", imageURL: beer.image_url ?? "", abv: beer.abv ?? 0, category: category.first?.categoryName ?? ""))
            }
        }
        filteredBeers.sort { first, second in
            return first.abv ?? 0 < second.abv ?? 0
        }
        return filteredBeers
    }
    
    func getCategories() -> [String] {
        
        let categories = filters.map { filter in
            return filter.categoryName
        }
        
        return categories
    }
}
