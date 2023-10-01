//
//  HomeBeerRepository.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

class HomeBeerRepository: HomeBeerRepositoryProtocol {
    
    private let dataSource: ServiceDataSource?
    
    init() {
        
        self.dataSource = ServiceDataSource()
    }
    
    func getBeers(completion: @escaping ([BeerModel]?, Error?) -> Void) {
        
        let urlPath = Constants.ConnectionUrl.beersUrl
        
        self.dataSource?.getServiceRequest(urlPath: urlPath) { (result) in
                
            switch result {
            case .success(let products):
                guard let productList = try? JSONDecoder().decode([BeerModel]?.self, from: products as! Data) else {
                    
                    let newError = ErrorModel(code: 0, description: "Error desconocido")
                    
                    completion(nil, newError)
                    
                    return
                }
                
                completion(productList, nil)
            case .failure(let error):
                let newError = ErrorModel(code: error.code, description: error.localizedDescription)
                
                completion(nil, newError)
            }
        }
    }
}
