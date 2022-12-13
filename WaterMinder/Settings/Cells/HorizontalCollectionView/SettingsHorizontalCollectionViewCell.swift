//
//  SettingsHorizontalCollectionViewCell.swift
//  WaterMinder
//
//  Created by Yuliya on 12/12/2022.
//

import UIKit

struct SettingsHorizontalCollectionViewModel {
    
}

class SettingsHorizontalCollectionViewCell: BaseCollectionViewCell,
                                            UICollectionViewDelegate,
                                            UICollectionViewDataSource,
                                            UICollectionViewDelegateFlowLayout {
    
    static var identifier: String {
        return String(describing: SettingsHorizontalCollectionViewCell.self)
    }
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemPink
        layout.scrollDirection = .horizontal
        return collectionView
    }()
    
    private let itemsInHorizontalCollection = [
        HorizontalCollectionViewModel(typeLiquidImage: UIImage(named: "mug"), liquidText: "Water"),
        HorizontalCollectionViewModel(typeLiquidImage: UIImage(named: "mug"), liquidText: "Tea"),
        HorizontalCollectionViewModel(typeLiquidImage: UIImage(named: "mug"), liquidText: "Smothie"),
        HorizontalCollectionViewModel(typeLiquidImage: UIImage(named: "mug"), liquidText: "Water"),
        HorizontalCollectionViewModel(typeLiquidImage: UIImage(named: "mug"), liquidText: "Coffee")
    ]
    
    override func setupView() {
        super.setupView()
        
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemPink
        
        collectionView.register(HorizontalCollectionViewCell.self,
                                forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.identifier, for: indexPath) as? HorizontalCollectionViewCell else { fatalError() }
        
        cell.set(itemsInHorizontalCollection[indexPath.item])
        return cell
    }
   
}
