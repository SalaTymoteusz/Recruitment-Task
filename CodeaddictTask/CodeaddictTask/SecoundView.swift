//
//  SecoundView.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class SecoundView: UIView {
    //WHAT I WILL NEEDED
    // 6x Label
    // 2x Button
    // 3x StackView
    // 3x ImageView
    
    private let repoByLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.textAlignment = .left
        lbl.text = "repo by".uppercased()
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let repoAuthorNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Repo Author Name"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 22)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let numberOfStarsLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.text = "Number of Stars (234)"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let repoTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Repo Title"
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let commitsHistoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Commits History"
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let shareRepoLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .blue
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let viewOnlineButton: UIButton = {
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
    
    private let shareRepoButton: UIButton = {
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
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "teacher"))
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Image of star
    private let starImage: UIImageView = {
        let star = UIImage(systemName: "star")
        let imageView = UIImageView(image: star)
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stackViewHorizontal: UIStackView = {
        let svh = UIStackView(arrangedSubviews: [UIView(), UIView()])
//        svh.distribution = .equalSpacing
        svh.axis = .horizontal
        svh.spacing = 4
        svh.translatesAutoresizingMaskIntoConstraints = false
        return svh
    }()
    
    private let stackViewVertical: UIStackView = {
        let svh = UIStackView(arrangedSubviews: [UIView(), UIView()])
        svh.distribution = .fill
        svh.axis = .vertical
        svh.spacing = 4
        svh.alignment = .leading
        svh.translatesAutoresizingMaskIntoConstraints = false
        return svh
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
