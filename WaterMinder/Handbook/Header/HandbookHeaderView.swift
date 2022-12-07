//
//  ViewOnHeader.swift
//  WaterMinder
//
//  Created by Yuliya on 07/12/2022.
//

import UIKit

struct HandbookViewModel {
    let trophyImage: UIImage?
    let generalText: String
    let addText: String
}

class HandbookHeaderView: UIView {
    
    static var identifier: String {
        return String(describing: HandbookHeaderView.self)
    }

    private let imageOnView = UIImageView()
    private let challengesLabel: UILabel = {
        let chalLabel = UILabel()
        chalLabel.textColor = .black
        chalLabel.font = .systemFont(ofSize: 18, weight: .heavy)
        chalLabel.textAlignment = .center
        return chalLabel
    }()
    
    private let textUnderChallengesLabel: UILabel = {
        let underChalLabel = UILabel()
        underChalLabel.font = .systemFont(ofSize: 12)
        underChalLabel.textColor = .black
        underChalLabel.numberOfLines = 0
        underChalLabel.lineBreakMode = .byWordWrapping
        underChalLabel.textAlignment = .center
        return underChalLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray
        layer.cornerRadius = 15
        
        addSubview(imageOnView)
        imageOnView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(challengesLabel)
        challengesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textUnderChallengesLabel)
        textUnderChallengesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageOnView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageOnView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOnView.heightAnchor.constraint(equalToConstant: 40),
            imageOnView.widthAnchor.constraint(equalToConstant: 40),

            challengesLabel.topAnchor.constraint(equalTo: imageOnView.bottomAnchor, constant: 15),
            challengesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            challengesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            textUnderChallengesLabel.topAnchor.constraint(equalTo: challengesLabel.bottomAnchor, constant: 5),
            textUnderChallengesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textUnderChallengesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textUnderChallengesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func set(_ dataView: HandbookViewModel) {
                
        imageOnView.image = dataView.trophyImage
        imageOnView.tintColor = .systemYellow

        challengesLabel.text = dataView.generalText

        textUnderChallengesLabel.text = dataView.addText
    }
    
}
