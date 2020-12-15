//
//  CommitCell.swift
//  CodeaddictTask
//
//  Created by xxx on 11/12/2020.
//

import UIKit

class CommitCell: UITableViewCell {
    
    let authorNameLabel: UILabel = { //height 13
        let lbl = UILabel()
        lbl.textColor = .systemBlue //0 122 255
        lbl.font = UIFont.systemFont(ofSize: 11, weight: .semibold) // SFPROTEXT-Semibold
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Commit author name"
        return lbl
    }()
    
    let authorEmailLabel: UILabel = { //height 22
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .regular) //SFProText-Regular
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "email@authorname.com"
        return lbl
    }()
    
    let messageLabel: UILabel = { //height 44
        let lbl = UILabel()
        lbl.textColor = .gray // 158 158 158
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.text = "This is a shor commit message"
        return lbl
    }()
    
    let counterDigit: UILabel = { //height 20, WIDTH 8
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1"
        return lbl
    }()
    
    let counterView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 36/2
        view.clipsToBounds = true
        return view
    }()
    
    private func setupSubViews() {
        counterView.addSubview(counterDigit)
        
        addSubview(counterView)
        addSubview(authorNameLabel)
        addSubview(authorEmailLabel)
        addSubview(messageLabel)
    }
    
    //Method for setting appropriate constraints
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
                        
            counterView.heightAnchor.constraint(equalToConstant: 36),
            counterView.widthAnchor.constraint(equalToConstant: 36),
            counterView.leftAnchor.constraint(equalTo: self.leftAnchor),
            counterView.topAnchor.constraint(equalTo: self.topAnchor, constant: 26),
            
            counterDigit.centerYAnchor.constraint(equalTo: counterView.centerYAnchor),
            counterDigit.centerXAnchor.constraint(equalTo: counterView.centerXAnchor),
            counterDigit.widthAnchor.constraint(equalToConstant: 10),
            counterDigit.heightAnchor.constraint(equalToConstant: 20),
            
            authorNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 76),
            authorNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            authorNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            authorNameLabel.heightAnchor.constraint(equalToConstant: 13),

            authorEmailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 76),
            authorEmailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            authorEmailLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 2),
            authorEmailLabel.heightAnchor.constraint(equalToConstant: 22),

            
            messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 76),
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            messageLabel.topAnchor.constraint(equalTo: authorEmailLabel.bottomAnchor, constant: 2),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
        ])
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        setupSubViews()
        setupAutoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
