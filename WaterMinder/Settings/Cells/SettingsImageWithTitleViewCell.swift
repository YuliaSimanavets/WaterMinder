//
//  SettingsImageWithTitleViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 07/12/2022.
//

import UIKit

struct SettingsImageWithTitleViewModel {
    let nearTitleImage: UIImage?
    let title: String
    let showSwitch: Bool
    let switchValue: Bool
}

class SettingsImageWithTitleViewCell: UICollectionViewCell {
 
    static var identifier: String {
        return String(describing: SettingsImageWithTitleViewCell.self)
    }
    
    private let generalIndents = CGFloat(15)
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    private let nearTitleImageView: UIImageView = {
        let nearTitleImageView = UIImageView()
        nearTitleImageView.tintColor = .white
        return nearTitleImageView
    }()
        
    private var mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemBlue
        return mySwitch
    }()
    
    private let disclosureIndicator: UIImageView = {
        let disclosureIndicator = UIImageView()
        disclosureIndicator.image = UIImage(systemName: "chevron.right")
        disclosureIndicator.tintColor = .white
        return disclosureIndicator
    }()
    
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
//        super.setupView()
        
        contentView.backgroundColor = .systemTeal
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nearTitleImageView)
        nearTitleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(mySwitch)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(disclosureIndicator)
        disclosureIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nearTitleImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nearTitleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: generalIndents),
            nearTitleImageView.heightAnchor.constraint(equalToConstant: 25),
            nearTitleImageView.widthAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: nearTitleImageView.trailingAnchor, constant: generalIndents),
            titleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -40),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10),
            
            mySwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mySwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -generalIndents),
            
            disclosureIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            disclosureIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -generalIndents)
       ])
    }
    
    func set(_ data: SettingsImageWithTitleViewModel) {
        
        titleLabel.text = data.title
        nearTitleImageView.image = data.nearTitleImage
        
        mySwitch.isOn = data.switchValue
        
        mySwitch.isHidden = !data.showSwitch
        disclosureIndicator.isHidden = data.showSwitch
        
    }
}
