//
//  DetailBeerRouter.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 2/10/23.
//

import Foundation

class DetailBeerRouter {
    
    private weak var detailBeerViewProtocol: DetailBeerViewProtocol!
    
    init(withView view: DetailBeerViewProtocol) {
        self.detailBeerViewProtocol = view
    }
}

extension DetailBeerRouter: DetailBeerRouterProtocol {
    
    
}
