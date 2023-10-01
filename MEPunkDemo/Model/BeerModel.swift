//
//  BeerModel.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

struct BeerModel: Decodable {
    
    var id: Int64?
    var name: String?
    var tagline: String?
    var first_brewed: String?
    var description: String?
    var image_url: String?
    var abv: Double?
    var ibu: Double?
    var target_fg: Double?
    var target_og: Double?
    var ebc: Double?
    var srm: Double?
    var ph: Double?
    var attenuation_level: Double?
    var food_pairing: [String]?
    var brewers_tips: String?
    var contributed_by: String?
}
