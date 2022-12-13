//
//  HistoryViewController.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

class HistoryViewController: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource,
                             UICollectionViewDelegateFlowLayout {

    private let historyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .lightGray
        layout.scrollDirection = .vertical
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(historyCollectionView)
        
        historyCollectionView.dataSource = self
        historyCollectionView.delegate = self
        
        historyCollectionView.register(HistoryCollectionViewCell.self,
                                       forCellWithReuseIdentifier: HistoryCollectionViewCell.identifier)
        historyCollectionView.register(HistoryHeaderViewCell.self,
                                       forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                       withReuseIdentifier: HistoryHeaderViewCell.identifier)
        
        NSLayoutConstraint.activate([
            historyCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            historyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            historyCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as? HistoryCollectionViewCell {
            
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        let widthCell = frame.width - CGFloat(20)
        let heightCell = CGFloat(50)
        return CGSize(width: widthCell, height: heightCell)
    }
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                        withReuseIdentifier: HistoryHeaderViewCell.identifier,
                                                                        for: indexPath) as? HistoryHeaderViewCell {
            
            header.set(HistoryHeaderViewModel(textHistory: "History",
                                              firstSegmentedControl: "D",
                                              secondSegmentedControl: "W",
                                              thirdSegmentedControl: "M",
                                              forthSegmentedControl: "Y"))
            
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
}
