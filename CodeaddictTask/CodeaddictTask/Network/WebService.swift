
//  WebService.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.

//let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars")!

import Foundation
import UIKit

class WebService: WebServiceProtocol {
    
    typealias eventResult = (Result<Event, NetworkError>) -> Void
    typealias commitsResult = (Result<[Commits], NetworkError>) -> Void
    typealias imageResult = (Result<UIImage, NetworkError>) -> Void
    
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
        let url = URL(string: "")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            
            DispatchQueue.main.async {
                completion(.success(UIImage(data: data!)!))
//                return UIImage(data: data!)
            }
        }
    }
}
