//
//  DetailBeerViewController.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 2/10/23.
//

import UIKit

class DetailBeerViewController: BaseViewController {

    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerAbvLabel: UILabel!
    @IBOutlet weak var beerIbuLabel: UILabel!
    @IBOutlet weak var beerEbcLabel: UILabel!
    @IBOutlet weak var beerPhLabel: UILabel!
    @IBOutlet weak var beerTagLineLabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    
    var presenter: DetailBeerPresenterProtocol?
    var configurator: DetailBeerConfiguratorProtocol?
    
    var beer: BeerModel = BeerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = DetailBeerConfigurator()
        configurator?.configure(viewController: self)
        
        self.setupVew()
    }
}

extension DetailBeerViewController {
    
    func setupVew() {
        
        // Setup navigation
        let navigationButtonBack = UIBarButtonItem(image: UIImage(named: "image-arrow-back")?.withTintColor(.white, renderingMode: .alwaysTemplate), style: .plain, target: self, action: #selector(self.goToBack))
        navigationButtonBack.tintColor = .white
        
        self.navigationItem.leftBarButtonItem = navigationButtonBack
        
        self.setupNavigationBar()
        self.setupTitle(titleText: "Beer info")
        
        // Set beer to presenter
        self.presenter?.setBeer(beer: self.beer)
        
        // Set info
        let beer = self.presenter?.getBeer()
        
        if let url = URL(string: beer?.image_url ?? "") {
            
            self.beerImage.kf.setImage(with: url, placeholder: UIImage(named: "splash-logo"), options: [.transition(.fade(0.5))])
        }
        
        // ABV
        let abvTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let abvAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let abvTitleAttString = NSAttributedString(string: "ABV: ", attributes: abvTitleAttribute)
        
        let abvAttString = NSAttributedString(string: "\(beer?.abv ?? 0)", attributes: abvAttribute)
        
        let abvFullAttString = NSMutableAttributedString()
        abvFullAttString.append(abvTitleAttString)
        abvFullAttString.append(abvAttString)
        
        // IBU
        let ibuTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let ibuAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let ibuTitleAttString = NSAttributedString(string: "IBU: ", attributes: ibuTitleAttribute)
        
        let ibuAttString = NSAttributedString(string: "\(beer?.ibu ?? 0)", attributes: ibuAttribute)
        
        let ibuFullAttString = NSMutableAttributedString()
        ibuFullAttString.append(ibuTitleAttString)
        ibuFullAttString.append(ibuAttString)
        
        // EBC
        let ebcTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let ebcAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let ebcTitleAttString = NSAttributedString(string: "EBC: ", attributes: ebcTitleAttribute)
        
        let ebcAttString = NSAttributedString(string: "\(beer?.ebc ?? 0)", attributes: ebcAttribute)
        
        let ebcFullAttString = NSMutableAttributedString()
        ebcFullAttString.append(ebcTitleAttString)
        ebcFullAttString.append(ebcAttString)
        
        // PH
        let phTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let phAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let phTitleAttString = NSAttributedString(string: "PH: ", attributes: phTitleAttribute)
        
        let phAttString = NSAttributedString(string: "\(beer?.ph ?? 0)", attributes: phAttribute)
        
        let phFullAttString = NSMutableAttributedString()
        phFullAttString.append(phTitleAttString)
        phFullAttString.append(phAttString)
        
        // Beer name
        let nameAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let nameAttString = NSAttributedString(string: "\(beer?.name ?? "")", attributes: nameAttribute)
        
        let nameFullAttString = NSMutableAttributedString()
        nameFullAttString.append(nameAttString)
        
        // Beer Tagline
        let tagLineAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Italic", size: 15.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let tagLineAttString = NSAttributedString(string: "\(beer?.tagline ?? "")", attributes: tagLineAttribute)
        
        let tagLineFullAttString = NSMutableAttributedString()
        tagLineFullAttString.append(tagLineAttString)
        
        // Beer description
        let descriptionAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 17.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let descriptionAttString = NSAttributedString(string: "\(beer?.description ?? "")", attributes: descriptionAttribute)
        
        let descriptionFullAttString = NSMutableAttributedString()
        descriptionFullAttString.append(descriptionAttString)
        
        self.beerAbvLabel.attributedText = abvFullAttString
        self.beerIbuLabel.attributedText = ibuFullAttString
        self.beerEbcLabel.attributedText = ebcFullAttString
        self.beerPhLabel.attributedText = phFullAttString
        self.beerNameLabel.attributedText = nameFullAttString
        self.beerTagLineLabel.attributedText = tagLineFullAttString
        self.beerDescriptionLabel.attributedText = descriptionFullAttString
    }
    
    @objc func goToBack() {
        
        self.presenter?.goToBack()
    }
}

extension DetailBeerViewController: DetailBeerViewProtocol {
    
    
}
