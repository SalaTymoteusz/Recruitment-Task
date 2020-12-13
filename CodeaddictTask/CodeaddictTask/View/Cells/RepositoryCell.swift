//
//  OwnerCell.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    //Rounded cell background
    let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 13
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Number of repository stars
    let repositoryStarsLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //Repository name
    let repositoryNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //Repository owner avatar
    let ownerImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "avatar"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
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
    
    //Image of arrow
    let arrowImage: UIImageView = {
        let arrow = UIImage(systemName: "chevron.forward")
        let imageView = UIImageView(image: arrow)
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Creating stackView for star image and number of stars label
    let stackViewHorizontal: UIStackView = {
        let svh = UIStackView(arrangedSubviews: [UIView(), UIView()])
        svh.distribution = .equalSpacing
        svh.alignment = .leading
        svh.axis = .horizontal
        svh.spacing = 0
        svh.translatesAutoresizingMaskIntoConstraints = false
        return svh
    }()
    
    //Creating stackView for repository name label and stackViewFirst
    let stackViewVertical: UIStackView = {
        let svh = UIStackView(arrangedSubviews: [UIView(), UIView()])
//        svh.distribution = .equalSpacing
        svh.axis = .vertical
        svh.spacing = 0
        svh.translatesAutoresizingMaskIntoConstraints = false
        return svh
    }()
    
    private func setupSubViews() {
        //Adding star image and number of stars label to stackView
        stackViewHorizontal.addArrangedSubview(starImage)
        stackViewHorizontal.addArrangedSubview(repositoryStarsLabel)
        
        //Adding stackView to rounded cell background
        grayView.addSubview(stackViewHorizontal)
        
        //Adding repository name label and stackViewFirst to stackView
        stackViewVertical.addArrangedSubview(repositoryNameLabel)
        stackViewVertical.addArrangedSubview(stackViewHorizontal)
        
        //Adding views
        grayView.addSubview(stackViewVertical)
        grayView.addSubview(ownerImage)
        grayView.addSubview(arrowImage)
        
        addSubview(grayView)
    }
    
    //Method for setting appropriate constraints
    private func setupAutoLayout(stackViewVertical: UIStackView, stackViewHorizontal: UIStackView) {
        NSLayoutConstraint.activate([
            
            //Constraints for star image
            starImage.heightAnchor.constraint(equalToConstant: 14),
            starImage.widthAnchor.constraint(equalToConstant: 14),
            
            //Constraints for avatar
            ownerImage.leftAnchor.constraint(equalTo: grayView.leftAnchor, constant: 16),
            ownerImage.heightAnchor.constraint(equalToConstant: 60),
            ownerImage.widthAnchor.constraint(equalToConstant: 60),
            ownerImage.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
            
            //Constraints for arrow image
            arrowImage.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
            arrowImage.rightAnchor.constraint(equalTo: grayView.rightAnchor, constant: -16),
            arrowImage.heightAnchor.constraint(equalToConstant: 13),
            arrowImage.widthAnchor.constraint(equalToConstant: 8),

            //Constraints for rounded cell background
            grayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            grayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            grayView.leftAnchor.constraint(equalTo: self.leftAnchor),
            grayView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            //Constraints for main stackView, it contains name of repository
            //and stackView for star image and number of stars
            stackViewVertical.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
            stackViewVertical.leftAnchor.constraint(equalTo: ownerImage.rightAnchor, constant: 16),
            
            stackViewHorizontal.heightAnchor.constraint(equalTo: starImage.heightAnchor),
            
                
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubViews()
        setupAutoLayout(stackViewVertical: stackViewVertical, stackViewHorizontal: stackViewHorizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

