//
//  Owner.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.


import Foundation
import UIKit

struct TableOfRepositories: Decodable {
    let items: [Repository]
}

struct Repository: Decodable {
    let name: String
    let stargazers_count: Int
    let owner: Owner
}

struct Owner: Decodable {
    let avatar_url: String
}

