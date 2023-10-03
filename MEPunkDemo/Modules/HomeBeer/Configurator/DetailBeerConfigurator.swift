//
//  DetailBeerConfigurator.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 2/10/23.
//

import Foundation

class DetailBeerConfigurator: DetailBeerConfiguratorProtocol {
    
    func configure(viewController: DetailBeerViewController) {
        
        viewController.presenter = DetailBeerPresenter(view: viewController)
    }
}
