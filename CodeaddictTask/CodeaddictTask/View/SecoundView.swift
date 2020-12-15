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
        lbl.textColor = UIColor(white: 1, alpha: 0.6)
        lbl.textAlignment = .left
        lbl.text = "repo by".uppercased()
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let repoAuthorNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Repo Author Name"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let numberOfStarsLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(white: 1, alpha: 0.5)
        lbl.text = "Number of Stars (234)"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let repoTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Repo Title"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let commitsHistoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Commits History"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let viewOnlineButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 17
        btn.clipsToBounds = true
        btn.setTitle("VIEW ONLINE", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.systemBlue, for: .normal) // 0 122 255
        btn.backgroundColor = .systemGray6
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let shareRepoButton: UIButton = {
        let btn = UIButton()
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .systemGray6
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.setTitle("Share Repo", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "square.and.arrow.up")
        btn.setImage(image, for: .normal)
        btn.currentImage?.withTintColor(.systemBlue)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 9)
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
        let star = UIImage(named: "starIcon")
        let imageView = UIImageView(image: star)
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
 
    private func setupSubViews() {
        //Adding views
        self.addSubview(contentView)
        
        titleView.addSubview(repoTitleLabel)
        titleView.addSubview(viewOnlineButton)
        
        backgroundImage.addSubview(spinner)
        
        contentView.addSubview(backgroundImage)
        contentView.addSubview(repoByLabel)
        contentView.addSubview(repoAuthorNameLabel)
        contentView.addSubview(starImage)
        contentView.addSubview(numberOfStarsLabel)
        contentView.addSubview(titleView)
        contentView.addSubview(shareRepoButton)
        contentView.addSubview(commitsHistoryLabel)
        contentView.addSubview(tableView)
        contentView.addSubview(tableViewSpinner)
        
    }

    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        setupSubViews()
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalToConstant: width),
            contentView.heightAnchor.constraint(equalToConstant: height),
            
            spinner.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            
            tableViewSpinner.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
            tableViewSpinner.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
        
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3),
            
            starImage.heightAnchor.constraint(equalToConstant: 13),
            starImage.widthAnchor.constraint(equalToConstant: 13),
            starImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            starImage.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -24),
            
            numberOfStarsLabel.heightAnchor.constraint(equalToConstant: 18),
            numberOfStarsLabel.leftAnchor.constraint(equalTo: starImage.rightAnchor, constant: 5),
            numberOfStarsLabel.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -22),
            
            repoAuthorNameLabel.heightAnchor.constraint(equalToConstant: 34),
            repoAuthorNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            repoAuthorNameLabel.bottomAnchor.constraint(equalTo: numberOfStarsLabel.topAnchor, constant: -6),
            
            repoByLabel.heightAnchor.constraint(equalToConstant: 20),
            repoByLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            repoByLabel.bottomAnchor.constraint(equalTo: repoAuthorNameLabel.topAnchor, constant: -4),

            titleView.heightAnchor.constraint(equalToConstant: 50),
            titleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            titleView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 20),

            repoTitleLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor),
            repoTitleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            repoTitleLabel.heightAnchor.constraint(equalToConstant: 22),

            viewOnlineButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            viewOnlineButton.rightAnchor.constraint(equalTo: titleView.rightAnchor),
            viewOnlineButton.heightAnchor.constraint(equalToConstant: 30),
            viewOnlineButton.widthAnchor.constraint(equalToConstant: 118),

            commitsHistoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            commitsHistoryLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 39),
            commitsHistoryLabel.heightAnchor.constraint(equalToConstant: 28),
            
            shareRepoButton.heightAnchor.constraint(equalToConstant: 50),
            shareRepoButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            shareRepoButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            shareRepoButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -44),
            
            tableView.topAnchor.constraint(equalTo: commitsHistoryLabel.bottomAnchor, constant: 10),
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
