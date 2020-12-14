//
//  ViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class FirstViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var event = Event()
    let shareView = FirstView()
    let cellId = "cellId"
    
//    private func createOwnerArray() {
//        repositories.append(Repository(repositoryName: "Tymek", ownerImage: #imageLiteral(resourceName: "avatar"), repositoryStars: 5))

    override func loadView() {
        super.loadView()
        
        setupView()
        setupTableView()
        setupSearchBar()
    }
    
    func updateUIWithRepositories() {
        shareView.tableView.reloadData()
    }
    
    func setupView() {
        view = shareView
    }
    
    func setupTableView() {
        shareView.tableView.register(RepositoryCell.self, forCellReuseIdentifier: cellId)
        shareView.tableView.dataSource = self
        shareView.tableView.delegate = self
    }
    
    func setupSearchBar() {
        shareView.searchBar.delegate = self
    }
    
    func downloadData(topic: String) -> Void {
        
        let url = URL(string: "https://api.github.com/search/repositories?q=language:\(topic)&sort=stars")!
        
        shareView.spinner.isHidden = false
        shareView.spinner.startAnimating()
        
        WebService.loadData(url: url) { (result) in
            switch result {
            case.failure(let error):
                print(error)
            case.success(let event):
                DispatchQueue.main.async() {
                    self.event = event
                    self.shareView.spinner.stopAnimating()
                    self.shareView.spinner.isHidden = true
                    self.updateUIWithRepositories()
                }
            }
        }
    }
}

// MARK: TABLEVIEW DATASOURCE CODE
extension FirstViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RepositoryCell

        //style for cell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        //data for cell
        cell.repositoryNameLabel.text = event.repositories.items?[indexPath.row].name
        cell.repositoryStarsLabel.text = String((event.repositories.items?[indexPath.row].stargazers_count)!)
        cell.ownerImage.image = UIImage()
        
        cell.spinner.isHidden = false
        cell.spinner.startAnimating()
        
        let url = URL(string: (event.repositories.items?[indexPath.row].owner?.avatar_url)!)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            
            DispatchQueue.main.async {
                cell.ownerImage.image = UIImage(data: data!)
                cell.spinner.stopAnimating()
                cell.spinner.isHidden = true
            }
        }

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = event.repositories.items?.count else {
            return 0
        }
        return numberOfRows
    }
}

// MARK: TABLEVIEW DELEGATE
extension FirstViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        coordinator?.cellTapped(data: (event.repositories.items?[indexPath.row])!)
    }
}

// MARK: SEARCHBAR DELEGATE
extension FirstViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //remove data from event repositories array
        event = Event()
        
        //remove cells from view
        updateUIWithRepositories()
        
        if let searchText = searchBar.text {
            downloadData(topic: searchText)
        }
    }
}


