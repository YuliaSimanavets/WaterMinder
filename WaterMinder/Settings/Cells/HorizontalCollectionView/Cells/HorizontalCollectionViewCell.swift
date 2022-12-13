//
//  HorizontalCollectionViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 12/12/2022.
//

import UIKit

struct HorizontalCollectionViewModel {
    let typeLiquidImage: UIImage?
    let liquidText: String
}

class HorizontalCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: HorizontalCollectionViewCell.self)
    }
    
    private let typeLiquidImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let liquidLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()

    
    override func setupView() {
        super.setupView()
        
        contentView.addSubview(typeLiquidImageView)
        typeLiquidImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(liquidLabel)
        liquidLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            typeLiquidImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            typeLiquidImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            typeLiquidImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            typeLiquidImageView.widthAnchor.constraint(equalToConstant: 100),
            typeLiquidImageView.heightAnchor.constraint(equalToConstant: 100),
            
            liquidLabel.topAnchor.constraint(equalTo: typeLiquidImageView.bottomAnchor, constant: 10),
            liquidLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    func set(_ data: HorizontalCollectionViewModel) {
        
        typeLiquidImageView.image = data.typeLiquidImage
        liquidLabel.text = data.liquidText
    }
}
