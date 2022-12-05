//
//  HandbookHeaderCollection.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

struct HandbookHeaderViewModel {
    let textHandbook: String
    let firstSegmentedControl: String
    let secondSegmentedControl: String
}

class HandbookHeaderCollection: UICollectionReusableView {

    static var identifier: String {
        return String(describing: HandbookHeaderCollection.self)
    }

    private let handbookLabel = UILabel()
    private var headerSegmentedControl = UISegmentedControl()
    private let itemOnHeaderView = HeaderView()

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
        
        addSubview(handbookLabel)
        handbookLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(itemOnHeaderView)
        itemOnHeaderView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            handbookLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            handbookLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            handbookLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            headerSegmentedControl.topAnchor.constraint(equalTo: handbookLabel.bottomAnchor, constant: 15),
            headerSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerSegmentedControl.heightAnchor.constraint(equalToConstant: 30),
            
            itemOnHeaderView.topAnchor.constraint(equalTo: headerSegmentedControl.bottomAnchor, constant: 20),
            itemOnHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            itemOnHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        
        ])
    }

    func set(_ dataHeader: HandbookHeaderViewModel) {

        headerSegmentedControl.insertSegment(withTitle: dataHeader.firstSegmentedControl, at: 0, animated: true)
        headerSegmentedControl.insertSegment(withTitle: dataHeader.secondSegmentedControl, at: 1, animated: true)
        headerSegmentedControl.backgroundColor = .white
        headerSegmentedControl.selectedSegmentTintColor = .systemBlue
        headerSegmentedControl.tintColor = .white
        
        handbookLabel.text = dataHeader.textHandbook
        handbookLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        handbookLabel.textColor = .white
        
        itemOnHeaderView.set(HeaderViewModel(nameImageOnView: "trophy.fill",
                                             generalText: "Challenges",
                                             addText: "Test yourself by completing these challenges"))
    }

}

struct HeaderViewModel {
    let nameImageOnView: String
    let generalText: String
    let addText: String
}

class HeaderView: UIView {
    
    static var identifier: String {
        return String(describing: HeaderView.self)
    }

    private let imageOnView = UIImageView()
    private let challengesLabel = UILabel()
    private let textUnderChallengesLabel = UILabel()

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
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .darkGray
        layer.cornerRadius = 15
        
        addSubview(imageOnView)
        imageOnView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(challengesLabel)
        challengesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textUnderChallengesLabel)
        textUnderChallengesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageOnView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageOnView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOnView.heightAnchor.constraint(equalToConstant: 40),
            imageOnView.widthAnchor.constraint(equalToConstant: 40),

            challengesLabel.topAnchor.constraint(equalTo: imageOnView.bottomAnchor, constant: 15),
            challengesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            challengesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            textUnderChallengesLabel.topAnchor.constraint(equalTo: challengesLabel.bottomAnchor, constant: 5),
            textUnderChallengesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textUnderChallengesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textUnderChallengesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func set(_ dataView: HeaderViewModel) {
                
        imageOnView.image = UIImage(systemName: dataView.nameImageOnView)
        imageOnView.tintColor = .systemYellow

        challengesLabel.text = dataView.generalText
        challengesLabel.textColor = .white
        challengesLabel.font = .systemFont(ofSize: 18, weight: .heavy)
        challengesLabel.textAlignment = .center

        textUnderChallengesLabel.text = dataView.addText
        textUnderChallengesLabel.font = .systemFont(ofSize: 12)
        textUnderChallengesLabel.numberOfLines = 0
        textUnderChallengesLabel.lineBreakMode = .byWordWrapping
        textUnderChallengesLabel.textAlignment = .center
    }
    
}

