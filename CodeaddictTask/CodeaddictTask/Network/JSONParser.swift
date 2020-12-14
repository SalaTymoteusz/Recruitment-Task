//
//  JSONParser.swift
//  CodeaddictTask
//
//  Created by xxx on 13/12/2020.
//

import Foundation

class JSONParser {
    
    typealias result<T> = (Result<T, NetworkError>) -> Void
    
    static func fetchData<T: Decodable>(of type: T.Type, from url: URL, completion: @escaping result<T>) {

        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                completion(.failure(.statusCodeError))
                return
            }
            
            if statusCode != 200 {
                completion(.failure(.invalidRequestError))
              return
            }

            guard let jsonData = data else {
                let err = NetworkError.dataError
                completion(.failure(err))
                return
            }
            
            do {
                let obj: T = try JSONDecoder().decode(T.self, from: jsonData)
                completion(.success(obj))
            }catch {
                let err = NetworkError.jsonDecodingError
                completion(.failure(err))
            }
        }
        dataTask.resume()
    }
}
