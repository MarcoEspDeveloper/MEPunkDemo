//
//  DetailBeerInteractor.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 2/10/23.
//

import Foundation

class DetailBeerInteractor: DetailBeerInteractorProtocol {
    
    var presenter: DetailBeerPresenterProtocol?
    
    init(presenter: DetailBeerPresenterProtocol) {
        
        self.presenter = presenter
    }
}
