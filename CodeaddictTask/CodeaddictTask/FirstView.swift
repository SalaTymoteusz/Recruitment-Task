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
        shb.translatesAutoresizingMaskIntoConstraints = false
        return shb
    }()
    
    //Label for Repositories caption
    let headerTitleLabel: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.textAlignment = .left
        lbl.text = "Repositories"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
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
