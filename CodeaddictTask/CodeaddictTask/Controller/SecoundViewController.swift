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
    
    private func setupView() {
        downloadAvatar()
        setupViewData()
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
                    shareView.tableView.separatorColor = .gray
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
        
        addTargets()
    }
    
    private func addTargets() {
        shareView.shareRepoButton.addTarget(self, action: #selector(shareRepo), for: .touchUpInside)
        shareView.viewOnlineButton.addTarget(self, action: #selector(viewOnline), for: .touchUpInside)
    }
    @objc private func viewOnline() {
        print("view online")
        if let url = URL(string: "https://www.hackingwithswift.com") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func shareRepo() {

        
        // text to share
        let text = "This is some text that I want to share."

        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
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
        
        //sprawdzić odległości
        //sprawdzić kolory
        //sprawdzić na tablecie
        
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
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = commits.isEmpty ? 0 : 3
        return numberOfRows
    }

}

