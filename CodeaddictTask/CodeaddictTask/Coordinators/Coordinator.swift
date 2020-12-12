//
//  Coordinator.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
