//
//  HomeBeerRouter.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation
import UIKit

class HomeBeerRouter {
    
    private weak var homeBeerViewProtocol: HomeBeerViewProtocol!
    
    init(withView view: HomeBeerViewProtocol) {
        self.homeBeerViewProtocol = view
    }
}

extension HomeBeerRouter: HomeBeerRouterProtocol {
    
    func goToDetailBeer(beer: BeerModel, originViewController: HomeBeerViewController) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinyViewController = storyboard.instantiateViewController(withIdentifier: "DetailBeerViewController") as! DetailBeerViewController
        destinyViewController.beer = beer
        originViewController.navigationController?.pushViewController(destinyViewController, animated: true)
    }
}
