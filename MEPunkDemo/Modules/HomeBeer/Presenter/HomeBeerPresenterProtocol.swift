//
//  HomeBeerPresenterProtocol.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

protocol HomeBeerPresenterProtocol {
    
    func getBeers()
    func didGetBeers(beerList: [BeerModel])
    func failGetBeers(error: ErrorModel)
    
    func getBeersByFood(food: String)
    func didGetBeersByFood(beerList: [BeerModel])
    func failGetBeersByFood(error: ErrorModel)
    
    func getBeerList() -> [BeerModel]
    func getIsLastPageLoaded() -> Bool
}
