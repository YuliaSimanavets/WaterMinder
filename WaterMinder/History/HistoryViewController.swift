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
//
//    private let waterLiquidType = HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Water")
//    private let coffeeLiquidType = HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Coffee")
//    private let teaLiquidType = HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Tea")
    
    let arrayWithLogs = [LiquidTypeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(historyLabel)
        historyLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(historySegmentedControl)
        historySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        historySegmentedControl.addTarget(self, action: #selector(segmentControllerTaped), for: .valueChanged)
        
        historySegmentedControl.insertSegment(withTitle: "D", at: 0, animated: true)
        historySegmentedControl.insertSegment(withTitle: "W", at: 1, animated: true)
        historySegmentedControl.insertSegment(withTitle: "M", at: 2, animated: true)
        historySegmentedControl.insertSegment(withTitle: "Y", at: 3, animated: true)
        
        view.addSubview(historyCollectionView)
        historyCollectionView.dataSource = self
        historyCollectionView.delegate = self
        
        historyCollectionView.register(HistoryCollectionViewCell.self,
                                       forCellWithReuseIdentifier: HistoryCollectionViewCell.identifier)
        
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
    
    @objc
    func segmentControllerTaped(_ parametr: UISegmentedControl) {
        
        switch parametr.selectedSegmentIndex {
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
  
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayWithLogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = arrayWithLogs[indexPath.item]
        
        switch item {
        case let .water(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as? HistoryCollectionViewCell {
                cell.set(model)
                return cell
            }
        case let .coffe(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as? HistoryCollectionViewCell {
                cell.set(model)
                return cell
            }
        case let .tea(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as? HistoryCollectionViewCell {
                cell.set(model)
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
    
}
