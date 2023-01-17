//
//  ViewController.swift
//  WaterMinder
//
//  Created by Yuliya on 05/12/2022.
//

import UIKit

class WaterMinderViewController: UIViewController {
    
    private let generalTitle: UILabel = {
        let generalTitle = UILabel()
        generalTitle.text = "Add a drink"
        generalTitle.textColor = .black
        generalTitle.font = .systemFont(ofSize: 30, weight: .heavy)
        generalTitle.translatesAutoresizingMaskIntoConstraints = false
        return generalTitle
    }()
    
    private let waterLiquid = LiqiudTypeView()
    private let coffeeLiquid = LiqiudTypeView()
    private let teaLiquid = LiqiudTypeView()
    
    var dataManager: DataManager?
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(generalTitle)

        let waterGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(waterTapAction))
        view.addSubview(waterLiquid)
        waterLiquid.translatesAutoresizingMaskIntoConstraints = false
        waterLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "water"), liquidText: "Water"))
        waterLiquid.addGestureRecognizer(waterGestureRecognizer)
        waterLiquid.isUserInteractionEnabled = true
       
        let coffeeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(coffeeTapAction))
        view.addSubview(coffeeLiquid)
        coffeeLiquid.translatesAutoresizingMaskIntoConstraints = false
        coffeeLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "сoffee"), liquidText: "Coffee"))
        coffeeLiquid.addGestureRecognizer(coffeeGestureRecognizer)
        coffeeLiquid.isUserInteractionEnabled = true
        
        let teaGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(teaTapAction))
        view.addSubview(teaLiquid)
        teaLiquid.translatesAutoresizingMaskIntoConstraints = false
        teaLiquid.set(LiqiudTypeViewModel(liquidImage: UIImage(named: "tea"), liquidText: "Tea"))
        teaLiquid.addGestureRecognizer(teaGestureRecognizer)
        teaLiquid.isUserInteractionEnabled = true

        
        let plusButton = UIImageView(image: UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysTemplate))
        plusButton.tintColor = .systemTeal
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusButton)
        
        view.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            generalTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            generalTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            generalTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
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
            plusButton.widthAnchor.constraint(equalToConstant: 100),
            plusButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setDataManager(_ data: DataManager) {
        dataManager = data
    }
    
    @objc
    func waterTapAction(_ tapButton: UIButton) {
        
        dataManager?.addData(LiquidModel(date: Date(), type: .water))
    }
    
    @objc
    func coffeeTapAction() {
        
        dataManager?.addData(LiquidModel(date: Date(), type: .coffee))
    }
    
    @objc
    func teaTapAction() {
        
        dataManager?.addData(LiquidModel(date: Date(), type: .tea))
    }
}

