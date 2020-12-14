//
//  SecoundViewCoordinator.swift
//  CodeaddictTask
//
//  Created by xxx on 12/12/2020.
//

import UIKit

class SecoundViewCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SecoundViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startWithData(data: Repository) {
        let vc = SecoundViewController()
        vc.repository = data
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
    
}
