//
//  HomeBeerConfigurator.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

class HomeBeerConfigurator: HomeBeerConfiguratorProtocol {
    
    func configure(viewController: HomeBeerViewController) {
        
        viewController.presenter = HomeBeerPresenter(view: viewController)
    }
}
