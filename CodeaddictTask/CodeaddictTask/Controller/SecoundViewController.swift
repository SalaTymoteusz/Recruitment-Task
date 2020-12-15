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
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    private func setupView() {
        view.addSubview(shareView.contentView)
        downloadAvatar()
        downloadData()
        setupViewData()
        setupTableView()
        addTargets()
    }

    private func setupTableView() {
        shareView.tableView.register(CommitCell.self, forCellReuseIdentifier: cellId)
        shareView.tableView.dataSource = self
        shareView.tableView.delegate = self
    }
    
    private func addTargets() {
        shareView.shareRepoButton.addTarget(self, action: #selector(shareRepo), for: .touchUpInside)
        shareView.viewOnlineButton.addTarget(self, action: #selector(viewOnline), for: .touchUpInside)
    }
    
    private func spinnerStart(spinner: UIActivityIndicatorView) {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    private func spinnerStop(spinner: UIActivityIndicatorView) {
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    private func setupViewData() {
        if let repoAuthorName = repository.owner?.login, let numberOfStars = repository.stargazers_count, let repoTitle = repository.name {
            shareView.repoAuthorNameLabel.text = repoAuthorName
            shareView.numberOfStarsLabel.text = "Number of Stars (\(numberOfStars))"
            shareView.repoTitleLabel.text = repoTitle
        } else {
            shareView.repoAuthorNameLabel.text = ""
            shareView.numberOfStarsLabel.text = "Number of Stars ()"
            shareView.repoTitleLabel.text = ""
        }
    }
    
    func downloadData() -> Void {
        guard let repoName = repository.name, let ownerName = repository.owner?.login else {
            return
        }
        let url = URL(string: "https://api.github.com/repos/\(ownerName)/\(repoName)/commits")!
        
        spinnerStart(spinner: shareView.tableViewSpinner)
        
        WebService.loadCommits(url: url) { (result) in
            switch result {
            case.failure(let error):
                print(error)
            case.success(let data):
                DispatchQueue.main.async() { [self] in
                    commits = data
                    shareView.tableView.reloadData()
                    spinnerStop(spinner: self.shareView.tableViewSpinner)
                    shareView.tableView.separatorColor = .systemGray6
                }
            }
        }
    }
    
    private func downloadAvatar() -> Void {
        spinnerStart(spinner: shareView.spinner)
        
        guard let avatarURL = repository.owner?.avatar_url else {
            return
        }
        
        let url = URL(string: avatarURL)!

        WebService.loadImage(url: url) { [self] (result) in
            switch result {
            case.failure(let error):
                print(error)
                spinnerStop(spinner: shareView.spinner)
                //Show error on the screen
            case.success(let img):
                DispatchQueue.main.async() {
                    shareView.backgroundImage.image = img
                    spinnerStop(spinner: shareView.spinner)
                }
            }
        }
    }
    
    //MARK: OBJECTIVE-C METHODS
    @objc private func viewOnline() {
        guard let link = repository.html_url else {
            return
        }
        
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func shareRepo() {
        // text to share
        guard let link = repository.html_url else {
            return
        }
        // set up activity view controller
        let linkToShare = [ link ]
        let activityViewController = UIActivityViewController(activityItems: linkToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension SecoundViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CommitCell
                
        //style for cell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        //data for cell
        cell.counterDigit.text = "\(indexPath.row + 1)"
        
        //Check if data exists
        if let authorName = commits[indexPath.row].commit?.committer?.name {
            cell.authorNameLabel.text = authorName
        } else {
            cell.authorNameLabel.text = ""
        }
        
        if let authorEmail = commits[indexPath.row].commit?.committer?.email {
            cell.authorEmailLabel.text = authorEmail
        } else {
            cell.authorEmailLabel.text = ""
        }
        
        if let message = commits[indexPath.row].commit?.message {
            cell.messageLabel.text = message
        } else {
            cell.messageLabel.text = ""
        }
 
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = commits.isEmpty ? 0 : 3
        return numberOfRows
    }
}

