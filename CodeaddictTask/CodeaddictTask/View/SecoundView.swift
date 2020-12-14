//
//  SecoundView.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class SecoundView: UIView {

    let repoByLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.textAlignment = .left
        lbl.text = "repo by".uppercased()
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let repoAuthorNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Repo Author Name"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 22)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let numberOfStarsLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.text = "Number of Stars (234)"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let repoTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Repo Title"
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let commitsHistoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Commits History"
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let shareRepoLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .blue
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let viewOnlineButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.setTitle("view online", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.backgroundColor = .lightGray
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.addTarget(self, action: #selector(viewOnlinetapped), for: .touchUpInside)
        return btn
    }()
    
    let shareRepoButton: UIButton = {
        let btn = UIButton()
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        btn.backgroundColor = .systemGray6
        btn.setTitleColor(.blue, for: .normal)
        btn.setTitle("Share Repo", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.addTarget(self, action: #selector(viewOnlinetapped), for: .touchUpInside)
        let image = UIImage(systemName: "square.and.arrow.up")
        btn.setImage(image, for: .normal)
//        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 15)
        
        return btn
    }()
    
    //Background image of repo author
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Image of star
    let starImage: UIImageView = {
        let star = UIImage(systemName: "star")
        let imageView = UIImageView(image: star)
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let stackViewHorizontal: UIStackView = {
        let svh = UIStackView(arrangedSubviews: [UIView(), UIView()])
//        svh.distribution = .equalSpacing
        svh.axis = .horizontal
        svh.spacing = 4
        svh.translatesAutoresizingMaskIntoConstraints = false
        return svh
    }()
    
    let stackViewVertical: UIStackView = {
        let svh = UIStackView(arrangedSubviews: [UIView(), UIView()])
        svh.distribution = .fill
        svh.axis = .vertical
        svh.spacing = 4
        svh.alignment = .leading
        svh.translatesAutoresizingMaskIntoConstraints = false
        return svh
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let tbl = UITableView()
        tbl.rowHeight = 50
        tbl.backgroundColor = .white
        tbl.separatorColor = .white
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spr = UIActivityIndicatorView()
        spr.style = .large
        spr.translatesAutoresizingMaskIntoConstraints = false
        spr.isHidden = true
        return spr
    }()
    
    let tableViewSpinner: UIActivityIndicatorView = {
        let spr = UIActivityIndicatorView()
        spr.style = .large
        spr.translatesAutoresizingMaskIntoConstraints = false
        spr.isHidden = true
        return spr
    }()
    
    //Method for setup stackViews
    private func setupStackViews() {
        
        //Adding star image and number of stars label to stackView
        stackViewHorizontal.addArrangedSubview(starImage)
        stackViewHorizontal.addArrangedSubview(numberOfStarsLabel)
        
        //Adding repo by inscription, repo author name and stackView with star image and number of stars
        stackViewVertical.addArrangedSubview(repoByLabel)
        stackViewVertical.addArrangedSubview(repoAuthorNameLabel)
        stackViewVertical.addArrangedSubview(stackViewHorizontal)
    }
 
    private func setupSubViews() {
        setupStackViews()
        
        self.addSubview(contentView)
        
        //Adding views
        titleView.addSubview(repoTitleLabel)
        titleView.addSubview(viewOnlineButton)
        
        backgroundImage.addSubview(spinner)
        
        contentView.addSubview(backgroundImage)
        contentView.addSubview(stackViewVertical)
        contentView.addSubview(titleView)
        contentView.addSubview(shareRepoButton)
        contentView.addSubview(commitsHistoryLabel)
//        contentView.addSubview(tableViewSpinner)
        contentView.addSubview(tableView)
        
    }

    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        setupSubViews()
        setupAutoLayout(stackView: stackViewVertical)
    }
    
    private func setupAutoLayout(stackView: UIStackView) {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalToConstant: width),
            contentView.heightAnchor.constraint(equalToConstant: height),
            
            spinner.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            
//            tableViewSpinner.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
//            tableViewSpinner.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
        
            //Constraints for
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3),
            
            stackViewVertical.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -22),
            stackViewVertical.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),

            starImage.heightAnchor.constraint(equalToConstant: 13),
            starImage.widthAnchor.constraint(equalToConstant: 13),
            starImage.centerYAnchor.constraint(equalTo: stackViewHorizontal.centerYAnchor),

            titleView.heightAnchor.constraint(equalToConstant: 50),
            titleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            titleView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 20),

            repoTitleLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor),
            repoTitleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),

            viewOnlineButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            viewOnlineButton.rightAnchor.constraint(equalTo: titleView.rightAnchor),

            commitsHistoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            commitsHistoryLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 35),
            commitsHistoryLabel.heightAnchor.constraint(equalToConstant: 28),
            
            shareRepoButton.heightAnchor.constraint(equalToConstant: 50),
            shareRepoButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            shareRepoButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            shareRepoButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44),
            
            tableView.topAnchor.constraint(equalTo: commitsHistoryLabel.bottomAnchor, constant: 10), // 383
//            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -95),
            tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: shareRepoButton.topAnchor, constant: -10),
        ])
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
