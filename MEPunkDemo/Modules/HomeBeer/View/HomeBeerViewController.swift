//
//  ViewController.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import UIKit
import MBProgressHUD

class HomeBeerViewController: UIViewController {

    var presenter: HomeBeerPresenterProtocol?
    var configurator: HomeBeerConfiguratorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = HomeBeerConfigurator()
        configurator?.configure(viewController: self)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        self.setupView()
        self.presenter?.getBeers()
    }

}

extension HomeBeerViewController {
    
    func setupView() {
        
    }
}

extension HomeBeerViewController: HomeBeerViewProtocol {
    
    func showBeerList() {
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

