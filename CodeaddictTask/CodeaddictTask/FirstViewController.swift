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
    let shareView = FirstView()
    
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
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(shareView)
        setupSafeArea()
    }
    
    override func loadView() {
        super.loadView()
        createOwnerArray()
        setupView()
    }
}

// MARK: SAFE AREA
extension FirstViewController {
    private func setupSafeArea() {
        let margins = view.layoutMarginsGuide
         NSLayoutConstraint.activate([
            shareView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            shareView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
         ])
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
          NSLayoutConstraint.activate([
            shareView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: shareView.bottomAnchor, multiplier: 1.0)
           ])
        } else {
           let standardSpacing: CGFloat = 8.0
           NSLayoutConstraint.activate([
            shareView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
           bottomLayoutGuide.topAnchor.constraint(equalTo: shareView.bottomAnchor, constant: standardSpacing)
           ])
        }
    }
}

