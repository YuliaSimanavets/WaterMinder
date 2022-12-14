//
//  HandbookChallengesViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

struct ChallengesViewModel {
    
    let leftImage: UIImage?
    let rightImage: UIImage?
    
    let leftChallengeText: String
    let rightChallengeText: String
    
    let leftChallengeNameText: String
    let rightChallengeNameText: String
    
    let backgroundColor: UIColor
}

class HandbookChallengesViewCell: BaseCollectionView {
    
    static var identifier: String {
        return String(describing: HandbookChallengesViewCell.self)
    }
    
    private let leftWaterImageView = UIImageView()
    
    private let rightNameChallengeLabel: UILabel = {
        let nameChallengeLabel = UILabel()
        nameChallengeLabel.textColor = .white
        nameChallengeLabel.font = .systemFont(ofSize: 22, weight: .heavy)
        nameChallengeLabel.numberOfLines = 0
        nameChallengeLabel.lineBreakMode = .byWordWrapping
        return nameChallengeLabel
    }()
    
    private let rightChallengeLabel: UILabel = {
        let challengeLable = UILabel()
        challengeLable.translatesAutoresizingMaskIntoConstraints = false
        challengeLable.font = .systemFont(ofSize: 16)
        challengeLable.textColor = .white
        return challengeLable
    }()
    
    private let rightWaterImageView = UIImageView()
    
    private let leftNameChallengeLable: UILabel = {
        let nameChallengeLabel = UILabel()
        nameChallengeLabel.textColor = .white
        nameChallengeLabel.font = .systemFont(ofSize: 22, weight: .heavy)
        nameChallengeLabel.numberOfLines = 0
        nameChallengeLabel.lineBreakMode = .byWordWrapping
        return nameChallengeLabel
    }()
    
    private let leftChallengeLabel: UILabel = {
        let challengeLable = UILabel()
        challengeLable.translatesAutoresizingMaskIntoConstraints = false
        challengeLable.font = .systemFont(ofSize: 16)
        challengeLable.textColor = .white
        return challengeLable
    }()
    
    override func setupView() {
        super.setupView()
        
        contentView.layer.cornerRadius = 20
        
        contentView.addSubview(rightWaterImageView)
        rightWaterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(leftChallengeLabel)
        
        contentView.addSubview(leftNameChallengeLable)
        leftNameChallengeLable.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(leftWaterImageView)
        leftWaterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(rightChallengeLabel)
        
        contentView.addSubview(rightNameChallengeLabel)
        rightNameChallengeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftWaterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            leftWaterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            leftWaterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leftWaterImageView.widthAnchor.constraint(equalToConstant: 110),
            
            rightChallengeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            rightChallengeLabel.leadingAnchor.constraint(equalTo: leftWaterImageView.trailingAnchor, constant: 30),
            
            rightNameChallengeLabel.topAnchor.constraint(equalTo: rightChallengeLabel.bottomAnchor, constant: 10),
            rightNameChallengeLabel.leadingAnchor.constraint(equalTo: leftWaterImageView.trailingAnchor, constant: 30),
            rightNameChallengeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            
            
            rightWaterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            rightWaterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            rightWaterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rightWaterImageView.widthAnchor.constraint(equalToConstant: 110),

            leftChallengeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            leftChallengeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            leftNameChallengeLable.topAnchor.constraint(equalTo: leftChallengeLabel.bottomAnchor, constant: 10),
            leftNameChallengeLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            leftNameChallengeLable.trailingAnchor.constraint(equalTo: rightWaterImageView.leadingAnchor, constant: -10)
        ])
    }
    
    func set(_ itemsInWater: ChallengesViewModel) {
        
        leftWaterImageView.image = itemsInWater.leftImage
        rightWaterImageView.image = itemsInWater.rightImage
        
        contentView.backgroundColor = itemsInWater.backgroundColor
    
        leftChallengeLabel.text = itemsInWater.leftChallengeText
        rightChallengeLabel.text = itemsInWater.rightChallengeText
        
        leftNameChallengeLable.text = itemsInWater.leftChallengeNameText
        rightNameChallengeLabel.text = itemsInWater.rightChallengeNameText
    }
    
}

