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
   

    private var settingsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemPurple
        layout.scrollDirection = .vertical
        return collectionView
    }()
    
    let itemInSections = [
        SettingsTitleViewModel(titleText: "Cups", addText: "tap icon to change value"),
        SettingsTitleViewModel(titleText: "Appearance", addText: ""),
        SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "apple.logo"), title: "Theme"),
        SettingsImageWithTitleViewModel(nearTitleImage: UIImage(systemName: "apple.logo"), title: "Theme"),
    ] as [Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        navigationItem.title = "Settings"
        
        view.addSubview(settingsCollectionView)
        settingsCollectionView.delegate = self
        settingsCollectionView.dataSource = self
        settingsCollectionView.register(SettingsTitleViewCell.self,
                                        forCellWithReuseIdentifier: SettingsTitleViewCell.identifier)
        settingsCollectionView.register(SettingsImageWithTitleViewCell.self,
                                        forCellWithReuseIdentifier: SettingsImageWithTitleViewCell.identifier)
        
        NSLayoutConstraint.activate([
            settingsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            settingsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            settingsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemInSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if indexPath.section == 0, indexPath.item == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsTitleViewCell.identifier, for: indexPath)
            guard let cellFirst = cell as? SettingsTitleViewCell else { fatalError() }

            cellFirst.set(itemInSections[0] as! SettingsTitleViewModel)
            return cellFirst
        } else if indexPath.section == 0, indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsTitleViewCell.identifier, for: indexPath)
            guard let cellSecond = cell as? SettingsTitleViewCell else { fatalError() }

            cellSecond.set(itemInSections[1] as! SettingsTitleViewModel)
            return cellSecond
        } else if indexPath.section == 0, indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier, for: indexPath)
            guard let cellThird = cell as? SettingsImageWithTitleViewCell else { fatalError() }

            cellThird.set(itemInSections[2] as! SettingsImageWithTitleViewModel)
            return cellThird
        } else if indexPath.section == 0, indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsImageWithTitleViewCell.identifier, for: indexPath)
            guard let cellThird = cell as? SettingsImageWithTitleViewCell else { fatalError() }
            
            cellThird.set(itemInSections[3] as! SettingsImageWithTitleViewModel)
            return cellThird
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        let widthCell = frame.width - CGFloat(20)
        let heightCell = CGFloat(100)
        return CGSize(width: widthCell, height: heightCell)
    }
}

