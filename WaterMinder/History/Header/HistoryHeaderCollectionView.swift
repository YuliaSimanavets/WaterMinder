//
//  HistoryHeaderCollectionView.swift
//  WaterMinder
//
//  Created by Yuliya on 20/12/2022.
//

import UIKit

struct HistoryHeaderViewModel {
    
    let historyText: String
}

class HistoryHeaderCollectionView: UICollectionReusableView {
        
    static var identifier: String {
        return String(describing: HistoryHeaderCollectionView.self)
    }

    private let historyLabel: UILabel = {
        let historyLabel = UILabel()
        historyLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        historyLabel.textColor = .black
        return historyLabel
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
        addSubview(historyLabel)
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            historyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            historyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            historyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            historyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func set(_ data: HistoryHeaderViewModel) {
        historyLabel.text = data.historyText
    }
    
}
