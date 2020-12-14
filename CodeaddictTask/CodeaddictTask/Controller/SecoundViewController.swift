//
//  SecoundViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class SecoundViewController: UIViewController {
    
    weak var coordinator: SecoundViewCoordinator?
    var commits = [Commit]()
    var repository = Repository()
    let shareView = SecoundView()
    let cellId = "CommitCell"
    
    private func createCommitsArray() {
        commits.append(Commit(authorName: "Commit author name", authorEmail: "email@authorname.com", message: "This is a shor commit messsage."))
        commits.append(Commit(authorName: "Commit author name", authorEmail: "email@authorname.com", message: "This is a shor commit messsage."))
        commits.append(Commit(authorName: "Commit author name", authorEmail: "email@authorname.com", message: "This is a commit message that needs to fold over to the next line."))
    }
    
    private func setupTableView() {
        shareView.tableView.register(CommitCell.self, forCellReuseIdentifier: cellId)
        shareView.tableView.dataSource = self
    }
    
    private func setupView() {
        shareView.repoAuthorNameLabel.text = repository.owner?.login
        shareView.numberOfStarsLabel.text = "Number of Stars (\(repository.stargazers_count!))"
        shareView.repoTitleLabel.text = repository.name
        
        let url = URL(string: (repository.owner?.avatar_url)!)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            
            DispatchQueue.main.async {
                self.shareView.backgroundImage.image = UIImage(data: data!)
            }
        }
        
        view = shareView
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
        createCommitsArray()
        
        setupView()
        setupTableView()
        
    }
}

extension SecoundViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CommitCell
        
        //style for cell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        //data for cell
        cell.authorNameLabel.text = commits[indexPath.row].authorName
        cell.authorEmailLabel.text = commits[indexPath.row].authorEmail
        cell.messageLabel.text = commits[indexPath.row].message
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

