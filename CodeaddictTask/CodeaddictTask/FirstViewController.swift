//
//  ViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit


//TEMPORARY DATA STRUCTURE
struct Owner {
    var repositoryName: String
    var ownerImage: UIImage
    var repositoryStars: Int
}

class FirstViewController: UIViewController {
    
    var owners: [Owner] = [Owner]()
    
    private func createOwnerArray() {
        owners.append(Owner(repositoryName: "Tymek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 5))
        owners.append(Owner(repositoryName: "Kuba", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 15))
        owners.append(Owner(repositoryName: "Marta", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 55))
        owners.append(Owner(repositoryName: "Radek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 65))
        owners.append(Owner(repositoryName: "Klaudia", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 0))
        owners.append(Owner(repositoryName: "Tymek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 5))
        owners.append(Owner(repositoryName: "Kuba", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 15))
        owners.append(Owner(repositoryName: "Marta", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 55))
        owners.append(Owner(repositoryName: "Radek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 65))
        owners.append(Owner(repositoryName: "Klaudia", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 0))
    }

    
    override func loadView() {
        super.loadView()
        createOwnerArray()
    }


}

