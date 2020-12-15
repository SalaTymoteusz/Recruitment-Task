//
//  WebServiceProtocol.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.
//

import Foundation

protocol WebServiceProtocol {
    
    typealias repositoriesResult = (Result<Repositories, NetworkError>) -> Void
    
    static func loadData(url: URL, completion: @escaping repositoriesResult)
    
}
