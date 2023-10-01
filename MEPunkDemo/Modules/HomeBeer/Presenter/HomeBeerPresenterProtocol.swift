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
    
    func getBeerList() -> [BeerModel]
}
