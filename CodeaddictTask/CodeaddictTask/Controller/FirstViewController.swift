//
//  ViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class FirstViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var repositories = Repositories()
    let shareView = FirstView()
    let cellId = "RepositoryCell"
    

    override func loadView() {
        super.loadView()
        setupView()
    }
    
    private func setupView() {
        view = shareView
        setupTableView()
        setupSearchBar()
        downloadData(topic: "Swift")
    }
    
    private func setupTableView() {
        shareView.tableView.register(RepositoryCell.self, forCellReuseIdentifier: cellId)
        shareView.tableView.dataSource = self
        shareView.tableView.delegate = self
    }
    
    private func setupSearchBar() {
        shareView.searchBar.delegate = self
    }
    
    private func updateUIWithRepositories() {
        shareView.tableView.reloadData()
    }
    
    private func spinnerStart(spinner: UIActivityIndicatorView) {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    private func spinnerStop(spinner: UIActivityIndicatorView) {
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    private func downloadData(topic: String) -> Void {
        
        let url = URL(string: "https://api.github.com/search/repositories?q=language:\(topic)&sort=stars")!
        
        spinnerStart(spinner: shareView.spinner)
        
        WebService.loadData(url: url) { [self] (result) in
            switch result {
            case.failure(let error):
                print(error)
                spinnerStop(spinner: shareView.spinner)
                //Show error on the screen
            case.success(let data):
                DispatchQueue.main.async() {
                    repositories = data
                    spinnerStop(spinner: shareView.spinner)
                    updateUIWithRepositories()
                }
            }
        }
    }
    
    private func downloadAvatar(url: URL, cell: RepositoryCell) -> Void {
        //Cell spinner start
        spinnerStart(spinner: cell.spinner)
        
        WebService.loadImage(url: url) { [self] (result) in
            switch result {
            case.failure(let error):
                print(error)
                spinnerStop(spinner: cell.spinner)
                //Show error on the screen
            case.success(let img):
                DispatchQueue.main.async() {
                    cell.ownerImage.image = img
                    spinnerStop(spinner: cell.spinner)
                }
            }
        }
    }
}

// MARK: TABLEVIEW DATASOURCE CODE
extension FirstViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RepositoryCell

        //Style for cell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        //Unwrap data for cell
        if let repositoryName = repositories.items?[indexPath.row].name,
           let repositoryStars = repositories.items?[indexPath.row].stargazers_count {
            cell.repositoryNameLabel.text = repositoryName
            cell.repositoryStarsLabel.text = String(repositoryStars)
        } else {
            cell.repositoryNameLabel.text = ""
            cell.repositoryStarsLabel.text = ""
        }
        
        cell.ownerImage.image = UIImage()
        
        //Fix, pass it to external object class
        guard let avatarURL = repositories.items?[indexPath.row].owner?.avatar_url else {
            return cell
        }
        
        let url = URL(string: avatarURL)!
        downloadAvatar(url: url, cell: cell)
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = repositories.items?.count else {
            return 0
        }
        return numberOfRows
    }
}

// MARK: TABLEVIEW DELEGATE
extension FirstViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let data = repositories.items?[indexPath.row] else {
            return
        }
        coordinator?.cellTapped(data: data)
    }
}

// MARK: SEARCHBAR DELEGATE
extension FirstViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //remove data from event repositories array
        repositories = Repositories()
        
        //remove cells from view
        updateUIWithRepositories()
        
        if let searchText = searchBar.text {
            downloadData(topic: searchText)
        }
    }
}


