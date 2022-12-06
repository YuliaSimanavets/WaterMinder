//
//  HandbookViewController.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

class HandbookViewController: UIViewController,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    private var handbookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        return collectionView
    }()
    
    private let itemsChallenges = [
        ChallengesViewModel(leftImage: UIImage(named: "0"),
                            rightImage: UIImage(named: "1"),
                            leftChallengeText: "CHALLENGE",
                            rightChallengeText: "",
                            leftChallengeNameText: "21-Day Hydration Habit",
                            rightChallengeNameText: "",
                            backgroundColor: .systemTeal),
        ChallengesViewModel(leftImage: UIImage(named: "2"),
                            rightImage: UIImage(named: ""),
                            leftChallengeText: "",
                            rightChallengeText: "CHALLENGE",
                            leftChallengeNameText: "",
                            rightChallengeNameText: "Pure Water",
                            backgroundColor: .systemPink),
        ChallengesViewModel(leftImage: UIImage(named: ""),
                            rightImage: UIImage(named: "3"),
                            leftChallengeText: "CHALLENGE",
                            rightChallengeText: "",
                            leftChallengeNameText: "Vitamin Boost",
                            rightChallengeNameText: "",
                            backgroundColor: .systemGreen),
        ChallengesViewModel(leftImage: UIImage(named: "4"),
                            rightImage: UIImage(named: ""),
                            leftChallengeText: "",
                            rightChallengeText: "CHALLENGE",
                            leftChallengeNameText: "",
                            rightChallengeNameText: "Vitamin Boost",
                            backgroundColor: .systemCyan)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(handbookCollectionView)
        handbookCollectionView.backgroundColor = .lightGray
        
        handbookCollectionView.register(HandbookChallengesViewCell.self,
                                        forCellWithReuseIdentifier: HandbookChallengesViewCell.identifier)
        handbookCollectionView.register(HandbookHeaderCollection.self,
                                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier: HandbookHeaderCollection.identifier)
        handbookCollectionView.delegate = self
        handbookCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            
            handbookCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            handbookCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            handbookCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            handbookCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsChallenges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HandbookChallengesViewCell.identifier, for: indexPath) as? HandbookChallengesViewCell {
            cell.set(itemsChallenges[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        let widthCell = frame.width - CGFloat(20)
        let heightCell = CGFloat(150)
        return CGSize(width: widthCell, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: HandbookHeaderCollection.identifier,
                                                                     for: indexPath)
        
        guard let myHeader = header as? HandbookHeaderCollection else { return header }
        
        myHeader.set(HandbookHeaderViewModel(handbookText: "Handbook"))
        
        return myHeader
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 270)
    }
    
}
