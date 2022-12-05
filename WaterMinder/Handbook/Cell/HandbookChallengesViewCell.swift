//
//  HandbookChallengesViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

struct ChallengesViewModel {
    
    let leftNamedImageView: String
    let rightNamedImageView: String
    
    let leftTextChallenge: String
    let rightTextChallenge: String
    
    let leftTextNameChallenge: String
    let rightTextNameChallenge: String
    
    let backgroundColor: UIColor
}

class HandbookChallengesViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: HandbookChallengesViewCell.self)
    }
    
    let leftWaterImageView = UIImageView()
    let rightTextNameChallenge = UILabel()
    let rightTextChallenge = UILabel()
    
    let rightWaterImageView = UIImageView()
    let leftTextNameChallenge = UILabel()
    let leftTextChallenge = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        
        contentView.layer.cornerRadius = 20
        
        contentView.addSubview(rightWaterImageView)
        rightWaterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(leftTextChallenge)
        leftTextChallenge.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(leftTextNameChallenge)
        leftTextNameChallenge.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(leftWaterImageView)
        leftWaterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(rightTextChallenge)
        rightTextChallenge.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(rightTextNameChallenge)
        rightTextNameChallenge.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftWaterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            leftWaterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            leftWaterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leftWaterImageView.widthAnchor.constraint(equalToConstant: 110),
            
            rightTextChallenge.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            rightTextChallenge.leadingAnchor.constraint(equalTo: leftWaterImageView.trailingAnchor, constant: 30),
            
            rightTextNameChallenge.topAnchor.constraint(equalTo: rightTextChallenge.bottomAnchor, constant: 10),
            rightTextNameChallenge.leadingAnchor.constraint(equalTo: leftWaterImageView.trailingAnchor, constant: 30),
            rightTextNameChallenge.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            
            
            rightWaterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            rightWaterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            rightWaterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rightWaterImageView.widthAnchor.constraint(equalToConstant: 110),

            leftTextChallenge.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            leftTextChallenge.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            leftTextNameChallenge.topAnchor.constraint(equalTo: leftTextChallenge.bottomAnchor, constant: 10),
            leftTextNameChallenge.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            leftTextNameChallenge.trailingAnchor.constraint(equalTo: rightWaterImageView.leadingAnchor, constant: -10)
        ])
    }
    
    func set(_ itemsInWater: ChallengesViewModel) {
        
        leftWaterImageView.image = UIImage(named: itemsInWater.leftNamedImageView)

        rightWaterImageView.image = UIImage(named: itemsInWater.rightNamedImageView)
        
        contentView.backgroundColor = itemsInWater.backgroundColor
        
        leftTextChallenge.text = itemsInWater.leftTextChallenge
        leftTextChallenge.font = .systemFont(ofSize: 16)
        leftTextChallenge.textColor = .white
        
        rightTextChallenge.text = itemsInWater.rightTextChallenge
        rightTextChallenge.font = .systemFont(ofSize: 16)
        rightTextChallenge.textColor = .white
        
        leftTextNameChallenge.text = itemsInWater.leftTextNameChallenge
        leftTextNameChallenge.textColor = .white
        leftTextNameChallenge.font = .systemFont(ofSize: 22, weight: .heavy)
        leftTextNameChallenge.numberOfLines = 0
        leftTextNameChallenge.lineBreakMode = .byWordWrapping
        
        rightTextNameChallenge.text = itemsInWater.rightTextNameChallenge
        rightTextNameChallenge.textColor = .white
        rightTextNameChallenge.font = .systemFont(ofSize: 22, weight: .heavy)
        rightTextNameChallenge.numberOfLines = 0
        rightTextNameChallenge.lineBreakMode = .byWordWrapping
    }
    
}

