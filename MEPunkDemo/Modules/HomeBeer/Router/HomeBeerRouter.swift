//
//  HomeBeerRouter.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

class HomeBeerRouter {
    
    private weak var homeBeerViewProtocol: HomeBeerViewProtocol!
    
    init(withView view: HomeBeerViewProtocol) {
        self.homeBeerViewProtocol = view
    }
}

extension HomeBeerRouter: HomeBeerRouterProtocol {
    
    
}
