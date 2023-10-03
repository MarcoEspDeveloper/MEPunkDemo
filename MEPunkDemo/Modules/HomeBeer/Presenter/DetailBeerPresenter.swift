//
//  DetailBeerPresenter.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 2/10/23.
//

import Foundation

class DetailBeerPresenter: DetailBeerPresenterProtocol {
    
    weak var detailBeerView: DetailBeerViewProtocol!
    var interactor: DetailBeerInteractorProtocol?
    var router: DetailBeerRouterProtocol?
    
    private var beer: BeerModel = BeerModel()
    
    init(view: DetailBeerViewProtocol) {
        
        self.detailBeerView = view
        self.interactor = DetailBeerInteractor(presenter: self)
        self.router = DetailBeerRouter(withView: self.detailBeerView)
    }
    
    // Get beer from loaded data
    func getBeer() -> BeerModel {
        return beer
    }
    
    // Set beer data
    func setBeer(beer: BeerModel) {
        
        self.beer = beer
    }
    
    // Go to back
    func goToBack() {
        self.router?.goToBack(originViewController: detailBeerView as! DetailBeerViewController)
    }
}
