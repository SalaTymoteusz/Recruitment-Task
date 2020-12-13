//
//  NetworkError.swift
//  CodeaddictTask
//
//  Created by xxx on 13/12/2020.
//

import Foundation

enum NetworkError: String, Error {
    case dataError = "No data available"
    case invalidRequestError = "Invalid Request"
    case unknownError = "Unknown Error"
    case statusCodeError = "Status Code Error"
    case jsonDecodingError = "JSON Decoding Error"
}
