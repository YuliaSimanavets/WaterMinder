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
    let loginTime: Date
}

class HistoryCollectionViewCell: BaseCollectionView {
    
    static var identifier: String {
        return String(describing: HistoryCollectionViewCell.self)
    }
    
    private let liquidImageView: UIImageView = {
        let liquidImage = UIImageView()
        liquidImage.contentMode = .scaleAspectFit
        liquidImage.tintColor = .white
        return liquidImage
    }()
    private let liquidTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()

    private let dateFormatter: DateFormatter = {
        let date = DateFormatter()
        date.dateFormat = "MMM d, h:mm a"
        return date
    }()
    
    private var timeLabel = UILabel()
    
    override func setupView() {
        super.setupView()
        
        backgroundColor = .orange
        
        addSubview(liquidImageView)
        liquidImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(liquidTypeLabel)
        liquidTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            liquidImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            liquidImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            liquidImageView.widthAnchor.constraint(equalToConstant: 40),
            liquidImageView.heightAnchor.constraint(equalToConstant: 40),
            
            liquidTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            liquidTypeLabel.leadingAnchor.constraint(equalTo: liquidImageView.trailingAnchor, constant: 15),
            liquidTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: liquidTypeLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func set(_ data: HistoryCollectionViewModel) {
        
        liquidImageView.image = data.liquidImage
        liquidTypeLabel.text = data.liquidTypeText
        
        timeLabel.text = dateFormatter.string(from: data.loginTime)
    }
}
