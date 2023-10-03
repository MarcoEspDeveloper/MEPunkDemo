//
//  ErrorModel.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

struct ErrorModel: Error {
    
    var code: Int?
    var description: String?
    
    init(code: Int?, description: String?) {
        
        self.code = code
        self.description = description
    }
}
