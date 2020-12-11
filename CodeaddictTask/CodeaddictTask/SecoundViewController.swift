//
//  SecoundViewController.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class SecoundViewController: UIViewController {
    let shareView = SecoundView()
    let tableView = UITableView()
    let cellId = "CommitCell"
    
    var commits: [Commit] = [Commit]()
    
    private func createCommitsArray() {
        commits.append(Commit(authorName: "Commit author name", authorEmail: "email@authorname.com", message: "This is a shor commit messsage."))
        commits.append(Commit(authorName: "Commit author name", authorEmail: "email@authorname.com", message: "This is a shor commit messsage."))
        commits.append(Commit(authorName: "Commit author name", authorEmail: "email@authorname.com", message: "This is a commit message that needs to fold over to the next line."))
    }
    
    private func setupTableView() {
        tableView.register(CommitCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.isUserInteractionEnabled = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true // 383
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -118).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        shareView.addSubview(tableView)
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

