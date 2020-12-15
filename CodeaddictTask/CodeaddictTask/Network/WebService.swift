
//  WebService.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.


import Foundation
import UIKit

class WebService: WebServiceProtocol {
    
    typealias repositoriesResult = (Result<Repositories, NetworkError>) -> Void
    typealias commitsResult = (Result<[Commits], NetworkError>) -> Void
    typealias imageResult = (Result<UIImage, NetworkError>) -> Void
    
    static func loadData(url: URL, completion: @escaping repositoriesResult) {
        JSONParser.fetchData(of: Repositories.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    static func loadCommits(url: URL, completion: @escaping commitsResult) {
        JSONParser.fetchDataFromArray(of: Commits.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    static func loadImage(url: URL, completion: @escaping imageResult) {
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                completion(.failure(.statusCodeError))
                return
            }
            
            if statusCode != 200 {
                completion(.failure(.invalidRequestError))
              return
            }
            
            guard let data = data else {
                let err = NetworkError.dataError
                completion(.failure(err))
                return
            }
            
            guard let image = UIImage(data: data) else {
                let err = NetworkError.dataError
                completion(.failure(err))
                return
            }
            
            completion(.success(image))
            
        }
        task.resume()
    }
}
