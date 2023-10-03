//
//  BaseNavigationController.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 2/10/23.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
}
