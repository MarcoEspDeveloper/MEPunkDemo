//
//  HomeBeerRepositoryProtocol.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

protocol HomeBeerRepositoryProtocol {
    
    func getBeers(completion: @escaping ([BeerModel]?, Error?) -> Void)
}
