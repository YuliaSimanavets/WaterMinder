//
//  CollectionViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 13/12/2022.
//

import UIKit

struct HistoryCollectionViewModel {
    let liquidImage: UIImage?
    let liquidTypeText: String
}

class HistoryCollectionViewCell: BaseCollectionView {
    
    static var identifier: String {
        return String(describing: HistoryCollectionViewCell.self)
    }
    
    private let liquidImageView: UIImageView = {
        let liquidImage = UIImageView()
        liquidImage.contentMode = .scaleAspectFit
        return liquidImage
    }()
    private let liquidTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
//
    private let myDate: DateFormatter = {
        let date = DateFormatter()
        date.dateStyle = .short
        date.dateFormat = .none
        let todayDate = Data()
        date.locale = Locale(identifier: "pl_PL")
        return date
    }()
//
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = .orange
        
        addSubview(liquidImageView)
        liquidImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(liquidTypeLabel)
        liquidTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            liquidImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            liquidImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            liquidImageView.widthAnchor.constraint(equalToConstant: 40),
            liquidImageView.heightAnchor.constraint(equalToConstant: 40),
            
            liquidTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            liquidTypeLabel.leadingAnchor.constraint(equalTo: liquidImageView.trailingAnchor, constant: 15),
            liquidTypeLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            
            
        ])
    }
    
    func set(_ data: HistoryCollectionViewModel) {
        liquidImageView.image = data.liquidImage
        liquidTypeLabel.text = data.liquidTypeText
    }
}
