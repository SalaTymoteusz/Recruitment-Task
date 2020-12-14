//
//  SecoundViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class SecoundViewController: UIViewController {
    
    weak var coordinator: SecoundViewCoordinator?
    var commits = [Commits]()
    var repository = Repository()
    let shareView = SecoundView()
    let cellId = "CommitCell"
    
    private func setupTableView() {
        shareView.tableView.register(CommitCell.self, forCellReuseIdentifier: cellId)
        shareView.tableView.dataSource = self
        shareView.tableView.delegate = self
    }
    
    private func spinnerStart() {
        shareView.spinner.isHidden = false
        shareView.spinner.startAnimating()
    }
    
    private func spinnerStop() {
        shareView.spinner.stopAnimating()
        shareView.spinner.isHidden = true
    }
    
    private func setupViewData() {
        shareView.repoAuthorNameLabel.text = repository.owner?.login
        shareView.numberOfStarsLabel.text = "Number of Stars (\(repository.stargazers_count!))"
        shareView.repoTitleLabel.text = repository.name
    }
    
    private func setupView() {
        setupViewData()
        spinnerStart()
        
        let url = URL(string: (repository.owner?.avatar_url)!)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            
            DispatchQueue.main.async {
                self.shareView.backgroundImage.image = UIImage(data: data!)
                self.spinnerStop()
            }
        }
//        self.view = shareView
    }
    
    
    func downloadData() -> Void {
        guard let repoName = repository.name, let ownerName = repository.owner?.login else {
            return
        }
        let url = URL(string: "https://api.github.com/repos/\(ownerName)/\(repoName)/commits")!
        
        shareView.tableViewSpinner.isHidden = false
        shareView.tableViewSpinner.startAnimating()
        
        WebService.loadCommits(url: url) { (result) in
            switch result {
            case.failure(let error):
                print(error)
            case.success(let data):
                DispatchQueue.main.async() {
                    self.commits = data
                    self.shareView.tableView.reloadData()
                    self.shareView.tableViewSpinner.stopAnimating()
                    self.shareView.tableViewSpinner.isHidden = true
                    self.shareView.tableView.separatorColor = .gray
                }
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
        
    override func loadView() {
        super.loadView()
        view.addSubview(shareView.contentView)
        
        setupView()
        setupTableView()
        downloadData()
        
            
        shareView.shareRepoButton.addTarget(self, action: #selector(shareRepo), for: .touchUpInside)
        shareView.viewOnlineButton.addTarget(self, action: #selector(shareRepo), for: .touchUpInside)
        
    }
    
    @objc private func shareRepo() {
        print("share repo")
    }
}

extension SecoundViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CommitCell
        
        //style for cell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        //data for cell
        cell.authorNameLabel.text = commits[indexPath.row].commit?.committer?.name
        cell.authorEmailLabel.text = commits[indexPath.row].commit?.committer?.email
        cell.messageLabel.text = commits[indexPath.row].commit?.message
        
        cell.counterDigit.text = "\(indexPath.row + 1)"
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = commits.isEmpty ? 0 : 13
        return numberOfRows
    }
}

