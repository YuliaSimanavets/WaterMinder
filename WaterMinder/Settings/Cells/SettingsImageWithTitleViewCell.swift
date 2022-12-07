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
}

class SettingsImageWithTitleViewCell: UICollectionViewCell {
 
    static var identifier: String {
        return String(describing: SettingsImageWithTitleViewCell.self)
    }
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 14, weight: .heavy)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    private let nearTitleImage = UIImageView()
    
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
        
        contentView.backgroundColor = .gray
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nearTitleImage)
        nearTitleImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nearTitleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nearTitleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nearTitleImage.heightAnchor.constraint(equalToConstant: 40),
            nearTitleImage.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: nearTitleImage.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.centerXAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10)
       ])
    }
    
    func set(_ dataImageWithTitle: SettingsImageWithTitleViewModel) {
        
        titleLabel.text = dataImageWithTitle.title
        nearTitleImage.image = dataImageWithTitle.nearTitleImage
        nearTitleImage.tintColor = .systemCyan
    }
}
