//
//  ServiceDataSource.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation
import Alamofire

class ServiceDataSource: ServiceDataSourceProtocol {
    
    private var sessionManager: Session?
    
    init() {
        
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        
        self.sessionManager = Session(configuration: configuration)
    }
    
    func getServiceRequest(urlPath: String, completion: @escaping (Result<Any?, NSError>) -> Void) {
        
        let url = "\(Constants.ConnectionUrl.baseUrl)\(urlPath)"
        
        self.sessionManager?.request(url).validate().responseData(completionHandler: { (response) in
            
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                let newError = NSError(domain: url, code: (response.response?.statusCode ?? 0)!, userInfo:[NSLocalizedDescriptionKey:error.localizedDescription])
                
                completion(.failure(newError))
            }
        })
    }
}
