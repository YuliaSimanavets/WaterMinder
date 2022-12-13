//
//  HistoryHeaderCollectionView.swift
//  WaterMinder
//
//  Created by Yuliya on 13/12/2022.
//

import UIKit

struct HistoryHeaderViewModel {
    let textHistory: String
    let firstSegmentedControl: String
    let secondSegmentedControl: String
    let thirdSegmentedControl: String
    let forthSegmentedControl: String
}

class HistoryHeaderViewCell: UICollectionReusableView {

    static var identifier: String {
        return String(describing: HistoryHeaderViewCell.self)
    }

    private let historyLabel: UILabel = {
        let history = UILabel()
        history.font = .systemFont(ofSize: 30, weight: .heavy)
        history.textColor = .black
        return history
    }()
    
    private var headerSegmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl()
        segmented.backgroundColor = .white
        segmented.selectedSegmentTintColor = .systemBlue
        segmented.tintColor = .white
        return segmented
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        
        addSubview(headerSegmentedControl)
        headerSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(historyLabel)
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            historyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            historyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            historyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            headerSegmentedControl.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 15),
            headerSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headerSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            headerSegmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func set(_ dataHeader: HistoryHeaderViewModel) {
        
        historyLabel.text = dataHeader.textHistory
        
        headerSegmentedControl.insertSegment(withTitle: dataHeader.firstSegmentedControl, at: 0, animated: true)
        headerSegmentedControl.insertSegment(withTitle: dataHeader.secondSegmentedControl, at: 1, animated: true)
        headerSegmentedControl.insertSegment(withTitle: dataHeader.thirdSegmentedControl, at: 2, animated: true)
        headerSegmentedControl.insertSegment(withTitle: dataHeader.forthSegmentedControl, at: 3, animated: true)
    }
}
