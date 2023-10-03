//
//  BaseViewController.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 2/10/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension BaseViewController {
    
    public func setupNavigationBar() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hex: Constants.AppColors.mainBeerBlue)
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    public func setupTitle(titleText: String?) {
        
        let label = UILabel()
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue Bold", size: 17.0)!,
                              NSAttributedString.Key.foregroundColor: UIColor.white]
        
        label.attributedText = NSAttributedString(string: titleText ?? "", attributes: titleAttributes)
        self.navigationItem.titleView = label
    }
}
