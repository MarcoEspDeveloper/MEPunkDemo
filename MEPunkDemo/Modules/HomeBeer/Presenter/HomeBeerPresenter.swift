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
    
    private var page: Int = 0
    private var isLastPageLoaded = false
    
    init(view: HomeBeerViewProtocol) {
        
        self.homeBeerView = view
        self.interactor = HomeBeerInteractor(presenter: self)
        self.router = HomeBeerRouter(withView: self.homeBeerView)
    }
    
    // Call to request beer list
    func getBeers() {
        
        self.interactor?.getBeers(page: self.page + 1)
    }
    
    func didGetBeers(beerList: [BeerModel]) {
        
        if self.page == 0 {
            
            self.beerList = []
        }
        
        if beerList.count > 0 {
            
            self.page += 1
        } else {
            
            self.isLastPageLoaded = true
        }
        
        self.beerList.append(contentsOf: beerList)
        
        self.homeBeerView.showBeerList()
    }
    
    func failGetBeers(error: ErrorModel) {
        
        self.homeBeerView.showBasicAlert(title: "Error", message: error.description ?? "")
    }
    
    // Call to request beer list by food param
    func getBeersByFood(food: String) {
        
        self.interactor?.getBeersByFood(food: food)
    }
    
    func didGetBeersByFood(beerList: [BeerModel]) {
        
        self.isLastPageLoaded = false
        self.page = 0
        self.beerList = beerList
        
        self.homeBeerView.showBeerList()
    }
    
    func failGetBeersByFood(error: ErrorModel) {
        
        self.homeBeerView.showBasicAlert(title: "Error", message: error.description ?? "")
    }
    
    // Get loaded local beer list
    func getBeerList() -> [BeerModel] {
        
        return self.beerList
    }
    
    func getIsLastPageLoaded() -> Bool {
        
        return self.isLastPageLoaded
    }
    
    // Router navigation
    func goToDetailBeer(beer: BeerModel) {
        
        self.router?.goToDetailBeer(beer: beer, originViewController: self.homeBeerView as! HomeBeerViewController)
    }
}
