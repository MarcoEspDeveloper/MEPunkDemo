//
//  HomeBeerInteractorProtocol.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

protocol HomeBeerInteractorProtocol {
    
    func getBeers(page: Int)
    func getBeersByFood(food: String)
}
