//
//  FirstView.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class FirstView: UIView {
    
    //Label for Search caption
    let searchLabel: UILabel = {
        let lbl = UILabel()
        lbl.sizeToFit()
        lbl.text = "Search"
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 34)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //Creating search bar
    let searchBar: UISearchBar = {
        let shb = UISearchBar()
        shb.sizeToFit()
        shb.placeholder = "Search"
        shb.isTranslucent = false
        shb.backgroundImage = UIImage()
        shb.backgroundColor = .lightGray
        shb.translatesAutoresizingMaskIntoConstraints = false
        return shb
    }()
    
    //Label for Repositories caption
    let headerTitleLabel: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.textAlignment = .left
        lbl.text = "Repositories"
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let tableView: UITableView = {
        let tbl = UITableView()
        tbl.rowHeight = 100
        tbl.separatorColor = .white
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //Method for setting constraints
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 89),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            searchLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            searchLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            searchLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            searchLabel.heightAnchor.constraint(equalToConstant: 41),

            searchBar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: -10),
            searchBar.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10),
            searchBar.heightAnchor.constraint(equalToConstant: 36),
            searchBar.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 14),

            headerTitleLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30),
            headerTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            headerTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            headerTitleLabel.heightAnchor.constraint(equalToConstant: 28),

            tableView.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    //Method for adding views
    private func addSubViews() {
        self.addSubview(contentView)
        contentView.addSubview(searchLabel)
        contentView.addSubview(searchBar)
        contentView.addSubview(headerTitleLabel)
        contentView.addSubview(tableView)
    }

    //Method for setting view
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        
        addSubViews()
        setupAutoLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

}
