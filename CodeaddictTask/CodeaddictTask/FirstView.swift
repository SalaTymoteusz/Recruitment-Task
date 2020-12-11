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
    
    //Method for setting constraints
    private func setupAutoLayout() {
        searchLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 34).isActive = true
        searchLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        searchLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        searchLabel.heightAnchor.constraint(equalToConstant: 41).isActive = true
        
        searchBar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -10).isActive = true
        searchBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        searchBar.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 14).isActive = true
        
        headerTitleLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30).isActive = true
        headerTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        headerTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        headerTitleLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
    
    //Method for adding views
    private func addSubViews() {
        self.addSubview(searchLabel)
        self.addSubview(searchBar)
        self.addSubview(headerTitleLabel)
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
