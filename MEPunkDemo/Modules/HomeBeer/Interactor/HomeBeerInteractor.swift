//
//  HomeBeerInteractor.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

class HomeBeerInteractor: HomeBeerInteractorProtocol {
    
    var presenter: HomeBeerPresenterProtocol?
    var repository: HomeBeerRepositoryProtocol?
    
    init(presenter: HomeBeerPresenterProtocol) {
        
        self.presenter = presenter
        self.repository = HomeBeerRepository()
    }
    
    func getBeers(page: Int) {
        
        self.repository?.getBeers(page: page) { (response, error) in
                
            if let beersResponse = response {
                
                self.presenter?.didGetBeers(beerList: beersResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetBeers(error: error as! ErrorModel)
            }
        }
    }
    
    func getBeersByFood(food: String) {
        
        self.repository?.getBeersByFood(food: food) { (response, error) in
            
            if let beersResponse = response {
                
                self.presenter?.didGetBeersByFood(beerList: beersResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetBeersByFood(error: error as! ErrorModel)
            }
        }
    }
}
