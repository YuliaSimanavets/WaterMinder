//
//  BaseCollectionViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 09/12/2022.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
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
    
    func setupView() {}
}

