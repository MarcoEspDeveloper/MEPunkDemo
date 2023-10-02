//
//  HomeBeerRepositoryProtocol.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

protocol HomeBeerRepositoryProtocol {
    
    func getBeers(page: Int, completion: @escaping ([BeerModel]?, Error?) -> Void)
    func getBeersByFood(food: String, completion: @escaping ([BeerModel]?, Error?) -> Void)
}
