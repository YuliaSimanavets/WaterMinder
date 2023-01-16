//
//  SettingsTitleViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 07/12/2022.
//

import UIKit

struct SettingsHeaderTitleViewModel {
    let titleText: String
    let addText: String
}

class SettingsHeaderTitleViewCell: UICollectionViewCell {
//    UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: SettingsHeaderTitleViewCell.self)
    }
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24, weight: .medium)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    let aditionalLabel: UILabel = {
        let additionalLabel = UILabel()
        additionalLabel.font = .systemFont(ofSize: 16)
        additionalLabel.textColor = .darkGray
        return additionalLabel
    }()
    
    private let generalIndents = CGFloat(20)
    
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
    
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(aditionalLabel)
        aditionalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            aditionalLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            aditionalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            aditionalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
 
    func set(_ data: SettingsHeaderTitleViewModel) {
        
        titleLabel.text = data.titleText
        aditionalLabel.text = data.addText
    }
}
