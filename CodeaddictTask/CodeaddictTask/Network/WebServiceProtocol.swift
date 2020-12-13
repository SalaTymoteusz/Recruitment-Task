//
//  WebServiceProtocol.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.
//

import Foundation

protocol WebServiceProtocol {
    
    typealias eventResult = (Result<Event, NetworkError>) -> Void
    
    static func loadData(url: URL, completion: @escaping eventResult)
    
}
