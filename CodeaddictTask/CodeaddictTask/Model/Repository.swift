//
//  Owner.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.


import Foundation
import UIKit

struct TableOfRepositories: Decodable {
    let items: [Repository]?
    
    init() {
        items = nil
    }
}

struct Repository: Decodable {
    let name: String?
    let stargazers_count: Int?
    let owner: Owner?
    let html_url: String?
    
    init() {
        name = nil
        stargazers_count = nil
        owner = nil
        html_url = nil
    }
}

struct Owner: Decodable {
    let avatar_url: String?
    let login: String?
    
    init() {
        avatar_url = nil
        login = nil
    }
}

