//
//  RecalculateController.swift
//  Tipsy
//
//  Created by Alexander on 20.06.24.
//

import UIKit

final class RecalculateController: BaseController {
    
    private let secondaryView = SecondaryView()
    private var totalPerPerson = UILabel()
    private var resultLabel = UILabel()
    private var recalculateButton = UIButton(type: .system)
    private var settingsLabel = UILabel()
    
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension RecalculateController {
    override func addViews() {
        super.addViews()
        
        view.addSubview(secondaryView)
        view.addSubview(recalculateButton)
        
        view.addSubview(totalPerPerson)
        view.addSubview(resultLabel)
        view.addSubview(settingsLabel)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            //secondary view
            secondaryView.topAnchor.constraint(equalTo: view.topAnchor),
            secondaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondaryView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33),
            
            //total per person label
            totalPerPerson.topAnchor.constraint(equalTo: view.topAnchor, constant: 132),
            totalPerPerson.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            totalPerPerson.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //result label
            resultLabel.topAnchor.constraint(equalTo: totalPerPerson.bottomAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            
            //recalculate button
            recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            recalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            recalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            recalculateButton.heightAnchor.constraint(equalToConstant: 54),
            
            //settings label
            settingsLabel.topAnchor.constraint(equalTo: secondaryView.bottomAnchor),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            settingsLabel.heightAnchor.constraint(equalToConstant: 117)
        ])
    }
    
    override func configure() {
        super.configure()
        
        secondaryView.translatesAutoresizingMaskIntoConstraints = false
        
        setupLabel(totalPerPerson, title: Resources.String.Recalculate.totalPerPerson, fontSize: 30, color: Resources.Colors.titleGray)
        
        setupLabel(resultLabel, title: result, fontSize: 45, color: Resources.Colors.greenButton)
        
        setupButton(recalculateButton, title: Resources.String.Recalculate.recalculate)
        
        setupSettingsLabel(settingsLabel, tip: tip, split: split, fontSize: 25, color: Resources.Colors.titleGray)
    }
}

private extension RecalculateController {
    
    func setupLabel(_ label: UILabel, title: String, fontSize: CGFloat, color: UIColor) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textAlignment = .center
        label.font = Resources.Fonts.systemRegular(with: fontSize)
        label.textColor = color
    }
    
    func setupSettingsLabel(_ label: UILabel, tip: Int, split: Int, fontSize: CGFloat, color: UIColor) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between \(split) people, with \(tip)% tip."
        label.textAlignment = .center
        label.font = Resources.Fonts.systemRegular(with: fontSize)
        label.textColor = color
        label.numberOfLines = 0
    }
    
    private func setupButton(_ button: UIButton, title: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = Resources.Colors.greenButton
        button.tintColor = UIColor.white
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = Resources.Fonts.systemRegular(with: 35)
        button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
    }
    
    @objc func recalculatePressed() {
        dismiss(animated: true)
    }
}
