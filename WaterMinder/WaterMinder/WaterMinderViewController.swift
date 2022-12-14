//
//  ViewController.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

class WaterMinderViewController: UIViewController {
    
    private let waterLiquid = LiqiudTypeView()
    private let coffeeLiquid = LiqiudTypeView()
    private let teaLiquid = LiqiudTypeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray3

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        view.addSubview(waterLiquid)
        waterLiquid.translatesAutoresizingMaskIntoConstraints = false
        waterLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "water"), liquidText: "Water"))
        waterLiquid.addGestureRecognizer(gestureRecognizer)
        waterLiquid.isUserInteractionEnabled = true
       
        view.addSubview(coffeeLiquid)
        coffeeLiquid.translatesAutoresizingMaskIntoConstraints = false
        coffeeLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "coffee"), liquidText: "Coffe"))
        coffeeLiquid.addGestureRecognizer(gestureRecognizer)
        coffeeLiquid.isUserInteractionEnabled = true
        
        view.addSubview(teaLiquid)
        teaLiquid.translatesAutoresizingMaskIntoConstraints = false
        teaLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "tea"), liquidText: "Tea"))
        teaLiquid.addGestureRecognizer(gestureRecognizer)
        teaLiquid.isUserInteractionEnabled = true

        let plusButton = UIImageView(image: UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysTemplate))
        plusButton.tintColor = .orange
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusButton)

//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
//        plusButton.addGestureRecognizer(gestureRecognizer)
//        plusButton.isUserInteractionEnabled = true
        
        view.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            waterLiquid.topAnchor.constraint(equalTo: view.centerYAnchor),
            waterLiquid.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            waterLiquid.widthAnchor.constraint(equalToConstant: 90),
            waterLiquid.heightAnchor.constraint(equalToConstant: 120),
            
            coffeeLiquid.centerYAnchor.constraint(equalTo: waterLiquid.centerYAnchor),
            coffeeLiquid.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coffeeLiquid.widthAnchor.constraint(equalToConstant: 90),
            coffeeLiquid.heightAnchor.constraint(equalToConstant: 120),
            
            teaLiquid.centerYAnchor.constraint(equalTo: waterLiquid.centerYAnchor),
            teaLiquid.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            teaLiquid.widthAnchor.constraint(equalToConstant: 90),
            teaLiquid.heightAnchor.constraint(equalToConstant: 120),
          
            plusButton.topAnchor.constraint(equalTo: waterLiquid.bottomAnchor, constant: 30),
            plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            plusButton.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            plusButton.widthAnchor.constraint(equalToConstant: 100),
            plusButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
 
    @objc
    func tapAction() {
        let historyVC = HistoryViewController()
        historyVC.modalPresentationStyle = .automatic
        present(historyVC, animated: true)
        
//        navigationController?.pushViewController(historyVC, animated: true)
    }
    
}

