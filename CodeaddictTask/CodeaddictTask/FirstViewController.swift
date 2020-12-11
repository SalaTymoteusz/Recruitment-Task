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
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(shareView)
        
        setupSafeArea()
        setupTableView()
    }
    
    override func loadView() {
        super.loadView()
        createOwnerArray()
        setupView()
    }
}

// MARK: TABLEVIEW CODE
extension FirstViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! OwnerCell
        let currentLastItem = owners[indexPath.row]
        cell.backgroundColor = .white
        cell.owner = currentLastItem
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return owners.count
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
