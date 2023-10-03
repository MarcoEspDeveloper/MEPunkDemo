//
//  DetailBeerPresenterProtocol.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 2/10/23.
//

import Foundation

protocol DetailBeerPresenterProtocol {
    
    func getBeer() -> BeerModel
    func setBeer(beer: BeerModel)
    
    func goToBack()
}
