
//  WebService.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.

//let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars")!

import Foundation
import UIKit

class WebService: WebServiceProtocol {
    
    typealias eventResult = (Result<Event, NetworkError>) -> Void
    
    static func loadData(url: URL, completion: @escaping eventResult) {
        JSONParser.fetchData(of: TableOfRepositories.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                let event = Event()
                event.repositories =  data
                completion(.success(event))
            }
        }
    }
}
