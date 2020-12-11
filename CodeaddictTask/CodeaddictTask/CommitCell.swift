//
//  CommitCell.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

//TEMPORARY DATA STRUCTURE
struct Commit {
    var authorName: String
    var authorEmail: String
    var message: String
}

class CommitCell: UITableViewCell {
    
    var commit: Commit? {
        didSet {
            authorNameLabel.text = commit?.authorName
            authorEmailLabel.text = commit?.authorEmail
            messageLabel.text = commit?.message
        }
    }
    
    private let authorNameLabel: UILabel = { //height 13
        let lbl = UILabel()
        lbl.textColor = .systemBlue //0 122 255
        lbl.font = UIFont.systemFont(ofSize: 11) // SFPROTEXT-Semibold
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Commit author name".uppercased()
        return lbl
    }()
    
    private let authorEmailLabel: UILabel = { //height 22
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 17) //SFProText-Regular
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "email@authorname.com"
        return lbl
    }()
    
    private let messageLabel: UILabel = { //height 44
        let lbl = UILabel()
        lbl.textColor = .gray // 158 158 158
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.text = "This is a shor commit message"
        return lbl
    }()
    
    private let counterDigit: UILabel = { //height 20, WIDTH 8
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1"
        return lbl
    }()
    
    private let counterView: UIView = { //36X36
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 36/2
        view.clipsToBounds = true
        return view
    }()
    
    private let stackViewVertical: UIStackView = {
        let svh = UIStackView(arrangedSubviews: [UIView(), UIView(), UIView()])
        svh.distribution = .equalSpacing
        svh.axis = .vertical
        svh.spacing = 4
        svh.translatesAutoresizingMaskIntoConstraints = false
        return svh
    }()
    
    private func setupSubViews() {
        counterView.addSubview(counterDigit)
        stackViewVertical.addArrangedSubview(authorNameLabel)
        stackViewVertical.addArrangedSubview(authorEmailLabel)
        stackViewVertical.addArrangedSubview(messageLabel)
        
        addSubview(counterView)
        addSubview(stackViewVertical)
    }
    
    //Method for setting appropriate constraints
    private func setupAutoLayout(stackView: UIStackView) {
        NSLayoutConstraint.activate([
            
            //Constraints for cell
            self.topAnchor.constraint(equalTo: self.topAnchor),
            self.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            counterView.heightAnchor.constraint(equalToConstant: 36),
            counterView.widthAnchor.constraint(equalToConstant: 36),
            counterView.leftAnchor.constraint(equalTo: self.leftAnchor),
            counterView.topAnchor.constraint(equalTo: self.topAnchor, constant: 26),
            
            counterDigit.centerYAnchor.constraint(equalTo: counterView.centerYAnchor),
            counterDigit.centerXAnchor.constraint(equalTo: counterView.centerXAnchor),
            counterDigit.widthAnchor.constraint(equalToConstant: 8),
            counterDigit.heightAnchor.constraint(equalToConstant: 20),
            
            stackViewVertical.leftAnchor.constraint(equalTo: counterView.rightAnchor, constant: 20),
            stackViewVertical.topAnchor.constraint(equalTo: self.topAnchor),
            stackViewVertical.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Setting white background color for cell
        self.backgroundColor = .white
        
        setupSubViews()
        setupAutoLayout(stackView: stackViewVertical)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
