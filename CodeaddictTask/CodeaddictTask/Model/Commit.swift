//
//  Commit.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.
//

import Foundation
import UIKit

struct Commits: Decodable {
    let commit: Commit?

    init() {
        commit = nil
    }
}

struct Commit: Decodable {
    let committer: Committer?
    let message: String?
    
    init() {
        committer = nil
        message = nil
    }
}

struct Committer: Decodable {
    let name: String?
    let email: String?
    
    init() {
        name = nil
        email = nil
    }
}
