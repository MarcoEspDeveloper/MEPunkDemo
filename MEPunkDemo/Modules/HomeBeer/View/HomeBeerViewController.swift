//
//  ViewController.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import UIKit
import MBProgressHUD

class HomeBeerViewController: BaseViewController {

    @IBOutlet weak var beersTableView: UITableView!
    @IBOutlet weak var beersSearchBar: UISearchBar!
    @IBOutlet weak var footerActivityIndicator: UIActivityIndicatorView!
    
    var presenter: HomeBeerPresenterProtocol?
    var configurator: HomeBeerConfiguratorProtocol?
    
    var isLoadingList = false
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = HomeBeerConfigurator()
        configurator?.configure(viewController: self)
        
        self.setupView()
        
        DispatchQueue.main.async {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        self.presenter?.getBeers()
    }

}

extension HomeBeerViewController {
    
    func setupView() {
        
        self.setupNavigationBar()
        self.setupTitle(titleText: "Beers")
        
        self.beersTableView.keyboardDismissMode = .onDrag
        self.beersTableView.tableFooterView?.isHidden = true
        
        let beersSearchToolBar = UIToolbar()
        let doneBtn = UIBarButtonItem(title: "Listo", style: .plain, target: self, action: #selector(handleViewTap))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        beersSearchToolBar.items = [flexSpace, flexSpace, doneBtn]
        beersSearchToolBar.sizeToFit()
        
        self.beersSearchBar.returnKeyType = .done
        self.beersSearchBar.showsCancelButton = true
    }
    
    @objc func handleViewTap() {
        view.endEditing(true)
    }
}

extension HomeBeerViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.beersTableView.tableFooterView?.isHidden = true
        self.beersTableView.setContentOffset(CGPointZero, animated: false)
        
        if searchText.count > 0 {
            
            self.presenter?.getBeersByFood(food: searchText.folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current))
        } else {
            
            self.presenter?.getBeers()
        }
        
        self.isSearching = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        self.beersSearchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.beersSearchBar.endEditing(true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.isSearching = searchBar.text != nil && searchBar.text!.count > 0 ? true : false
    }
}

extension HomeBeerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let beerList = self.presenter?.getBeerList() {
            
            return beerList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let beer = self.presenter?.getBeerList()[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBeerTableViewCell", for: indexPath) as! HomeBeerTableViewCell
        
        cell.setupCell(beer: beer)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let beer = self.presenter?.getBeerList()[indexPath.row] {
            
            self.presenter?.goToDetailBeer(beer: beer)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (self.presenter?.getIsLastPageLoaded())! || isSearching {
            
            self.footerActivityIndicator.stopAnimating()
            self.beersTableView.tableFooterView?.isHidden = true
            
            return
        }
        
        if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height && !isLoadingList {
            
            isLoadingList = true
            self.footerActivityIndicator.startAnimating()
            self.beersTableView.tableFooterView?.isHidden = false
            self.presenter?.getBeers()
        }
    }
}

extension HomeBeerViewController: HomeBeerViewProtocol {
    
    func showBeerList() {
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        self.isLoadingList = false
        self.beersTableView.reloadData()
    }
    
    func showBasicAlert(title: String, message: String) {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

