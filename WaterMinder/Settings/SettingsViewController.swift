//
//  SettingsViewController.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

class SettingsViewController: UIViewController,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
   

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .lightGray
        layout.scrollDirection = .vertical
        return collectionView
    }()
    
    let arrayCells: [[SettingsModel]] = [
        [.otherDrinks(SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "mug"), title: "Other Drinks", showSwitch: false, switchValue: false))],
        [.theme(SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "slider.horizontal.2.square.on.square"), title: "Theme", showSwitch: false, switchValue: false)),
         .appIcon(SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "app.badge.checkmark"), title: "App Icon", showSwitch: false, switchValue: false)),
         .homeScreen(SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "doc.on.clipboard"), title: "Home Screen", showSwitch: false, switchValue: false)),
         .appleWatch(SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "applewatch.watchface"), title: "Apple Watch", showSwitch: false, switchValue: false)),
         .sharing(SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "person.2"), title: "Sharing", showSwitch: true, switchValue: true))],
        [.siriShortcuts(SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "mic"), title: "Siri Shortcuts", showSwitch: false, switchValue: false))]
        ]

    let arrayHeader: [[SettingsModel]] = [
        [.cups(SettingsHeaderTitleViewModel(titleText: "Cups", addText: "tap icon to change value"))],
        [.appearance(SettingsHeaderTitleViewModel(titleText: "Appearance", addText: ""))],
        [.general(SettingsHeaderTitleViewModel(titleText: "General", addText: ""))]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        navigationItem.title = "Settings"
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SettingsHeaderTitleViewCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SettingsHeaderTitleViewCell.identifier)
        collectionView.register(SettingsImageWithTitleViewCell.self,
                                forCellWithReuseIdentifier: SettingsImageWithTitleViewCell.identifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCells[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let item = arrayCells[indexPath.section][indexPath.item]
        
        switch item {
        case let .otherDrinks(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier,
                                                             for: indexPath) as? SettingsImageWithTitleViewCell {
                cell.set(model)
                return cell
            }
        case let .theme(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier,
                                                             for: indexPath) as? SettingsImageWithTitleViewCell {
                cell.set(model)
                return cell
            }
        case let .appIcon(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier,
                                                             for: indexPath) as? SettingsImageWithTitleViewCell {
                cell.set(model)
                return cell
            }
        case let .homeScreen(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier,
                                                             for: indexPath) as? SettingsImageWithTitleViewCell {
                cell.set(model)
                return cell
            }
        case let .appleWatch(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier,
                                                             for: indexPath) as? SettingsImageWithTitleViewCell {
                cell.set(model)
                return cell
            }
        case let .sharing(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier,
                                                             for: indexPath) as? SettingsImageWithTitleViewCell {
                cell.set(model)
                return cell
            }
        case let .siriShortcuts(model):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier,
                                                             for: indexPath) as? SettingsImageWithTitleViewCell {
                cell.set(model)
                return cell
            }
        default: break
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

        let item = arrayHeader[indexPath.section][indexPath.item]
        
        switch item {
        case let .cups(model):
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                            withReuseIdentifier: SettingsHeaderTitleViewCell.identifier,
                                                                            for: indexPath) as? SettingsHeaderTitleViewCell {
                header.set(model)
                return header
            }
        case let .appearance(model):
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                            withReuseIdentifier: SettingsHeaderTitleViewCell.identifier,
                                                                            for: indexPath) as? SettingsHeaderTitleViewCell {
                header.set(model)
                return header
            }
        case let .general(model):
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                            withReuseIdentifier: SettingsHeaderTitleViewCell.identifier,
                                                                            for: indexPath) as? SettingsHeaderTitleViewCell {
                header.set(model)
                return header
            }
        default:
            break
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 70)
    }
}


