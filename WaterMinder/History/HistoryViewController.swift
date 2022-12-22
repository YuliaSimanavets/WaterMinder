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
    
    var dataManager: DataManager?
    
    private let historyLabel: UILabel = {
        let history = UILabel()
        history.text = "History"
        history.font = .systemFont(ofSize: 30, weight: .heavy)
        history.textColor = .black
        return history
    }()
    
    private var historySegmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl()
        segmented.backgroundColor = .white
        segmented.selectedSegmentTintColor = .systemBlue
        segmented.tintColor = .white
        return segmented
    }()
    
    private let historyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .lightGray
        layout.scrollDirection = .vertical
        return collection
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        historyCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(historyLabel)
        historyLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(historySegmentedControl)
        historySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        historySegmentedControl.addTarget(self, action: #selector(segmentControllerTapped), for: .valueChanged)
        
        historySegmentedControl.insertSegment(withTitle: "D", at: 0, animated: true)
        historySegmentedControl.insertSegment(withTitle: "W", at: 1, animated: true)
        historySegmentedControl.insertSegment(withTitle: "M", at: 2, animated: true)
        historySegmentedControl.insertSegment(withTitle: "Y", at: 3, animated: true)
        
        view.addSubview(historyCollectionView)
        historyCollectionView.dataSource = self
        historyCollectionView.delegate = self
        
        historyCollectionView.register(HistoryCollectionViewCell.self,
                                       forCellWithReuseIdentifier: HistoryCollectionViewCell.identifier)
        historyCollectionView.register(HistoryHeaderCollectionView.self,
                                       forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                       withReuseIdentifier: HistoryHeaderCollectionView.identifier)
                
        NSLayoutConstraint.activate([
            historyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            historyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            historyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            historySegmentedControl.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 15),
            historySegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            historySegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            historySegmentedControl.heightAnchor.constraint(equalToConstant: 30),
            
            historyCollectionView.topAnchor.constraint(equalTo: historySegmentedControl.bottomAnchor, constant: 30),
            historyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            historyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            historyCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataManager?.getData().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as? HistoryCollectionViewCell,
           let item = dataManager?.getData()[indexPath.item] {

            switch item.type {
            case .water:
                cell.set(.init(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Water", loginTime: item.date))
                return cell
            case .coffee:
                cell.set(.init(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Coffee", loginTime: item.date))
                return cell
            case .tea:
                cell.set(.init(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Tea", loginTime: item.date))
                return cell
            }
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
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: HistoryHeaderCollectionView.identifier,
                                                                     for: indexPath)
            
            guard let myHeader = header as? HistoryHeaderCollectionView else { return header }
            myHeader.set(HistoryHeaderViewModel(historyText: "Today's Logs"))
            return myHeader
        }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.size.width, height: 50)
    }
        
    func setDataManager(_ data: DataManager) {
        dataManager = data
    }
    
    @objc
    func segmentControllerTapped(_ parameter: UISegmentedControl) {
        
        switch parameter.selectedSegmentIndex {
        case 0:
            print("1")
        case 1:
            print("2")
        case 2:
            print("3")
        case 3:
            print("4")
        default:
            break
        }
    }
}
