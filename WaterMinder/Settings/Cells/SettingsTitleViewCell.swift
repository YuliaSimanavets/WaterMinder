//
//  SettingsTitleViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 07/12/2022.
//

import UIKit

struct SettingsTitleViewModel {
    let titleText: String
    let addText: String
}

class SettingsTitleViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: SettingsTitleViewCell.self)
    }
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    let aditionalLabel: UILabel = {
        let additionalLabel = UILabel()
        additionalLabel.font = .systemFont(ofSize: 16)
        additionalLabel.textColor = .black
        return additionalLabel
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
    
    private func setupView() {
            
        contentView.backgroundColor = .gray

        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(aditionalLabel)
        aditionalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            aditionalLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5),
            aditionalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            aditionalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
 
    func set(_ data: SettingsTitleViewModel) {
        
        titleLabel.text = data.titleText
        aditionalLabel.text = data.addText
    }}
