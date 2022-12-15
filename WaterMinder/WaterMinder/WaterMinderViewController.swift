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
    
    private let waterLiquidType = HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Water")
    private let coffeeLiquidType = HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Coffee")
    private let teaLiquidType = HistoryCollectionViewModel(liquidImage: UIImage(systemName: "cup.and.saucer"), liquidTypeText: "Tea")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray3

        let waterGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(waterTapAction))
        view.addSubview(waterLiquid)
        waterLiquid.translatesAutoresizingMaskIntoConstraints = false
        waterLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "water"), liquidText: "Water"))
        waterLiquid.addGestureRecognizer(waterGestureRecognizer)
        waterLiquid.isUserInteractionEnabled = true
       
        let coffeeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(coffeeTapAction))
        view.addSubview(coffeeLiquid)
        coffeeLiquid.translatesAutoresizingMaskIntoConstraints = false
        coffeeLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "coffee"), liquidText: "Coffe"))
        coffeeLiquid.addGestureRecognizer(coffeeGestureRecognizer)
        coffeeLiquid.isUserInteractionEnabled = true
        
        let teaGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(teaTapAction))
        view.addSubview(teaLiquid)
        teaLiquid.translatesAutoresizingMaskIntoConstraints = false
        teaLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "tea"), liquidText: "Tea"))
        teaLiquid.addGestureRecognizer(teaGestureRecognizer)
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
    func waterTapAction(_ tapButton: UIButton) {
        
        addData(.water(waterLiquidType))
        print("water")
    }
    
    @objc
    func coffeeTapAction() {

        addData(.coffe(coffeeLiquidType))
        print("coffee")
    }
    
    @objc
    func teaTapAction() {
        
        addData(.tea(teaLiquidType))
        print("tea")
    }
    
}

