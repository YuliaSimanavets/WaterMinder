//
//  LiqiudTypeView.swift
//  WaterMinder
//
//  Created by Yuliya on 14/12/2022.
//

import UIKit

struct LiqiudTypeViewModel {
    let liquidImage: UIImage?
    let liquidText: String
}

class LiqiudTypeView: UIView {

    private let liquidImageView: UIImageView = {
        let liquidImage = UIImageView()
        liquidImage.contentMode = .scaleAspectFit
        return liquidImage
    }()
    
    private let liquidLabel: UILabel = {
        let liquidLabel = UILabel()
        liquidLabel.font = .systemFont(ofSize: 14)
        liquidLabel.textColor = .black
        return liquidLabel
    }()
    
    let today = Data()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemTeal
        layer.cornerRadius = 10
        
        addSubview(liquidImageView)
        addSubview(liquidLabel)
        
        liquidImageView.translatesAutoresizingMaskIntoConstraints = false
        liquidLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            liquidImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            liquidImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            liquidImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            liquidImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            liquidLabel.topAnchor.constraint(equalTo: liquidImageView.bottomAnchor, constant: 10),
            liquidLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    func set(_ data: LiqiudTypeViewModel) {
        
        liquidImageView.image = data.liquidImage
        liquidLabel.text = data.liquidText
    }

}
