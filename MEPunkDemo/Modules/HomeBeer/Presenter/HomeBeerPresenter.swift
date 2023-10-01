//
//  HomeBeerPresenter.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

class HomeBeerPresenter: HomeBeerPresenterProtocol {
    
    weak var homeBeerView: HomeBeerViewProtocol!
    var interactor: HomeBeerInteractorProtocol?
    var router: HomeBeerRouterProtocol?
    
    private var beerList: [BeerModel] = []
    
    init(view: HomeBeerViewProtocol) {
        
        self.homeBeerView = view
        self.interactor = HomeBeerInteractor(presenter: self)
        self.router = HomeBeerRouter(withView: self.homeBeerView)
    }
    
    // Call to request beer list
    func getBeers() {
        
        self.interactor?.getBeers()
    }
    
    func didGetBeers(beerList: [BeerModel]) {
        
        self.beerList = []
        self.beerList.append(contentsOf: beerList)
        
        self.homeBeerView.showBeerList()
    }
    
    func failGetBeers(error: ErrorModel) {
        
    }
    
    // Get loaded local beer list
    func getBeerList() -> [BeerModel] {
        
        return self.beerList
    }
}
