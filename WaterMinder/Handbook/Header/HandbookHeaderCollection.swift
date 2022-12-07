//
//  HandbookHeaderCollection.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

struct HandbookHeaderViewModel {
    
    let handbookText: String
}

class HandbookHeaderCollection: UICollectionReusableView {

    static var identifier: String {
        return String(describing: HandbookHeaderCollection.self)
    }

    private let handbookLabel: UILabel = {
        let handbookLabel = UILabel()
        handbookLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        handbookLabel.textColor = .black
        return handbookLabel
    }()
    
    private var headerSegmentedControl: UISegmentedControl = {
        let headerSegmentedControl = UISegmentedControl()
        headerSegmentedControl.backgroundColor = .white
        headerSegmentedControl.selectedSegmentTintColor = .gray
        headerSegmentedControl.tintColor = .black
        return headerSegmentedControl
    }()
    
    private let itemOnHeaderView = HandbookHeaderView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        
        addSubview(headerSegmentedControl)
        headerSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(handbookLabel)
        handbookLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(itemOnHeaderView)
        itemOnHeaderView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            handbookLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            handbookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            handbookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            headerSegmentedControl.topAnchor.constraint(equalTo: handbookLabel.bottomAnchor, constant: 15),
            headerSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headerSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            headerSegmentedControl.heightAnchor.constraint(equalToConstant: 30),
            
            itemOnHeaderView.topAnchor.constraint(equalTo: headerSegmentedControl.bottomAnchor, constant: 20),
            itemOnHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            itemOnHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        
        ])
    }

    func set(_ dataHeader: HandbookHeaderViewModel) {

        headerSegmentedControl.insertSegment(withTitle: "Challengies", at: 0, animated: true)
        headerSegmentedControl.insertSegment(withTitle: "Achievements", at: 1, animated: true)
        
        handbookLabel.text = dataHeader.handbookText
        
        itemOnHeaderView.set(HandbookViewModel(trophyImage: UIImage(systemName: "trophy.fill"),
                                               generalText: "Challenges",
                                               addText: "Test yourself by completing these challenges"))
    }
}



