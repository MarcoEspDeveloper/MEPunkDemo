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
    
    func getBeers() {
        
        self.repository?.getBeers() { (response, error) in
                
            if let beersResponse = response {
                
                self.presenter?.didGetBeers(beerList: beersResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetBeers(error: error as! ErrorModel)
            }
        }
    }
}
