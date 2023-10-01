//
//  ServiceDataSourceProtocol.swift
//  MEPunkDemo
//
//  Created by Marco Antonio  on 30/09/23.
//

import Foundation

protocol ServiceDataSourceProtocol {
    
    func getServiceRequest(urlPath: String, completion: @escaping (Swift.Result<Any?, NSError>) -> Void)
}
