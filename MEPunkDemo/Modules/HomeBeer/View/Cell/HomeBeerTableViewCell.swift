//
//  HomeBeerTableViewCell.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 1/10/23.
//

import UIKit
import Kingfisher

class HomeBeerTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeBeerTableViewCell {
    
    func setupCell(beer: BeerModel?) {
        
        self.titleLabel.text = beer?.name ?? ""
        
        if let url = URL(string: beer?.image_url ?? "") {
            
            self.beerImage.kf.setImage(with: url, options: [.transition(.fade(0.5))])
        }
    }
}
