//
//  SecoundViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class SecoundViewController: UIViewController {
    let shareView = SecoundView()
    let cellId = "CommitCell"
    var commits: [Commit] = [Commit]()
    
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
        view = shareView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
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
        let currentLastItem = commits[indexPath.row]
        cell.backgroundColor = .white
        cell.commit = currentLastItem
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

