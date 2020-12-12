//
//  ViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class FirstViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var owners: [Owner] = [Owner]()
    let shareView = FirstView()
    let cellId = "cellId"
    
    
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
    
    private func setupTableView() {
        shareView.tableView.register(OwnerCell.self, forCellReuseIdentifier: cellId)
        shareView.tableView.dataSource = self
        shareView.tableView.delegate = self
    }

    private func setupView() {
        view = shareView
    }
    
    override func loadView() {
        super.loadView()
    
        createOwnerArray()
        setupView()
        setupTableView()
    }
}

// MARK: TABLEVIEW DATASOURCE CODE
extension FirstViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! OwnerCell
        
        //style for cell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        //data for cell
        cell.repositoryNameLabel.text = owners[indexPath.row].repositoryName
        cell.ownerImage.image = owners[indexPath.row].ownerImage
        cell.repositoryStarsLabel.text = String(owners[indexPath.row].repositoryStars)
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return owners.count
    }
}

// MARK: TABLEVIEW DELEGATE
extension FirstViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("cell tapped")
        
        coordinator?.cellTapped()
        
    }

    
}
