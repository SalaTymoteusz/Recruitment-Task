//
//  ViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {
    
    
    weak var coordinator: MainCoordinator?
    let shareView = FirstView()
    let cellId = "cellId"
    
//    private func createOwnerArray() {
//        repositories.append(Repository(repositoryName: "Tymek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 5))
//        repositories.append(Repository(repositoryName: "Kuba", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 15))
//        repositories.append(Repository(repositoryName: "Marta", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 55))
//        repositories.append(Repository(repositoryName: "Radek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 65))
//        repositories.append(Repository(repositoryName: "Klaudia", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 0))
//        repositories.append(Repository(repositoryName: "Tymek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 5))
//        repositories.append(Repository(repositoryName: "Kuba", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 15))
//        repositories.append(Repository(repositoryName: "Marta", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 55))
//        repositories.append(Repository(repositoryName: "Radek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 65))
//        repositories.append(Repository(repositoryName: "Klaudia", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 0))
//    }

    override func loadView() {
        super.loadView()
        
        
        setupView()
        setupTableView()
        
    }
    
    func downloadData() -> Void {
        WebService.loadData() { (result) in
            switch result {
            case.failure(let error):
                print(error)
            case.success(let event):
                print(event.currenciesA.count)
                self.eventt = event
            }
        }
    }
    
    func updateUIWithRepositories() {
        shareView.tableView.reloadData()
    }
    
    func setupTableView() {
        shareView.tableView.register(RepositoryCell.self, forCellReuseIdentifier: cellId)
//        shareView.tableView.dataSource = self
        shareView.tableView.delegate = self
    }

    func setupView() {
        view = shareView
    }
}

// MARK: TABLEVIEW DATASOURCE CODE
//extension FirstViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RepositoryCell
//
//        //style for cell
//        cell.backgroundColor = .white
//        cell.selectionStyle = .none
//
//        //data for cell
//        cell.repositoryNameLabel.text = repositories[indexPath.row].repositoryName
//        cell.ownerImage.image = repositories[indexPath.row].ownerImage
//        cell.repositoryStarsLabel.text = String(repositories[indexPath.row].repositoryStars)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return repositories.count
//    }
//}
//
// MARK: TABLEVIEW DELEGATE
extension FirstViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("cell tapped")

        coordinator?.cellTapped()

    }
}



