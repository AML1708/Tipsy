//
//  CalculateController.swift
//  Tipsy
//
//  Created by Alexander on 19.06.24.
//

import UIKit

class CalculateController: BaseController {
    
    private let secondaryView = SecondaryView()
    private let enterBillTotalLabel = UILabel()
    private let selectTipLabel = UILabel()
    private let button0 = UIButton(type: .system)
    private let button10 = UIButton(type: .system)
    private let button20 = UIButton(type: .system)
    private let chooseSplitLabel = UILabel()
    private let splitNumberLabel = UILabel()
    private let stepper = UIStepper()
    private let calculateButton = UIButton(type: .system)
    private let buttonsStackView = UIStackView()
    private let textField = UITextField()
    
    private var buttons: [UIButton] = []
    private var tip = 0.0
    private var billTotal = 0.0
    private var numberOfPeople = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateButtonAppearance(button0, selected: true)
    }
    
}

extension CalculateController {
    
    override func addViews() {
        super.addViews()
        
        view.addSubview(secondaryView)
        view.addSubview(enterBillTotalLabel)
        view.addSubview(textField)
        
        secondaryView.addSubview(selectTipLabel)
        secondaryView.addSubview(buttonsStackView)
        secondaryView.addSubview(chooseSplitLabel)
        secondaryView.addSubview(splitNumberLabel)
        secondaryView.addSubview(stepper)
        secondaryView.addSubview(calculateButton)

    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            //secondary green view
            secondaryView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            secondaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondaryView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75),
            
            //Enter bill total label
            enterBillTotalLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            enterBillTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            enterBillTotalLabel.heightAnchor.constraint(equalToConstant: 30),
            enterBillTotalLabel.widthAnchor.constraint(equalToConstant: 150),
            
            //Select tip label
            selectTipLabel.topAnchor.constraint(equalTo: secondaryView.topAnchor, constant: 60),
            selectTipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            selectTipLabel.heightAnchor.constraint(equalToConstant: 30),
            selectTipLabel.widthAnchor.constraint(equalToConstant: 101),
            
            //Stack view for buttons
            buttonsStackView.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 35),
            buttonsStackView.leadingAnchor.constraint(equalTo: secondaryView.leadingAnchor, constant: 30),
            buttonsStackView.trailingAnchor.constraint(equalTo: secondaryView.trailingAnchor, constant: -30),
            
            //Choose split label
            chooseSplitLabel.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 36),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: selectTipLabel.leadingAnchor),
            chooseSplitLabel.heightAnchor.constraint(equalToConstant: 30),
            chooseSplitLabel.widthAnchor.constraint(equalToConstant: 137),
            
            //Split number label
            splitNumberLabel.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 45),
            splitNumberLabel.leadingAnchor.constraint(equalTo: secondaryView.leadingAnchor, constant: 120),
            splitNumberLabel.heightAnchor.constraint(equalToConstant: 32),
            splitNumberLabel.widthAnchor.constraint(equalToConstant: 45),
            
            //Stepper
            stepper.topAnchor.constraint(equalTo: splitNumberLabel.topAnchor),
            stepper.leadingAnchor.constraint(equalTo: splitNumberLabel.trailingAnchor, constant: 27),
            
            //Calculate button
            calculateButton.bottomAnchor.constraint(equalTo: secondaryView.bottomAnchor, constant: -34),
            calculateButton.leadingAnchor.constraint(equalTo: secondaryView.leadingAnchor, constant: 107),
            calculateButton.trailingAnchor.constraint(equalTo: secondaryView.trailingAnchor, constant: -107),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            
            //Text field
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: enterBillTotalLabel.bottomAnchor, constant: 8),
            textField.widthAnchor.constraint(equalToConstant: 194),
            textField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    override func configure() {
        super.configure()
        secondaryView.translatesAutoresizingMaskIntoConstraints = false
        
        setupLabel(enterBillTotalLabel, title: Resources.String.Calculate.enterBillTotal, fontSize: 25, color: Resources.Colors.titleGray)
        setupLabel(selectTipLabel, title: Resources.String.Calculate.selectTip, fontSize: 25, color: Resources.Colors.titleGray)
        setupLabel(chooseSplitLabel, title: Resources.String.Calculate.chooseSplit, fontSize: 25, color: Resources.Colors.titleGray)
        setupLabel(splitNumberLabel, title: "1", fontSize: 35, color: Resources.Colors.greenButton)
        
        setupButton(button0, title: "0%")
        setupButton(button10, title: "10%")
        setupButton(button20, title: "20%")
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.addArrangedSubview(button0)
        buttonsStackView.addArrangedSubview(button10)
        buttonsStackView.addArrangedSubview(button20)
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 20
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .fill
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 1
        stepper.maximumValue = 25
        stepper.value = 1
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.layer.cornerRadius = 10
        calculateButton.backgroundColor = Resources.Colors.greenButton
        calculateButton.tintColor = UIColor.white
        calculateButton.setTitle(Resources.String.Calculate.calculate, for: .normal)
        calculateButton.titleLabel?.font = Resources.Fonts.systemRegular(with: 35)
        calculateButton.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Resources.String.Calculate.placeholder
        textField.font = Resources.Fonts.systemRegular(with: 40)
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
    }
}

@objc extension CalculateController {
    
    private func setupButton(_ button: UIButton, title: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.greenButton, for: .normal)
        button.titleLabel?.font = Resources.Fonts.systemRegular(with: 30)
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        buttons.append(button)
    }
    
    func setupLabel(_ label: UILabel, title: String, fontSize: CGFloat, color: UIColor) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textAlignment = .center
        label.font = Resources.Fonts.systemRegular(with: fontSize)
        label.textColor = color
    }
    
    func updateButtonAppearance(_ button: UIButton, selected: Bool) {
        
        if selected {
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = Resources.Colors.greenButton
        } else {
            button.setTitleColor(Resources.Colors.greenButton, for: .normal)
            button.backgroundColor = .clear
        }
    }
    
    func tipChanged(_ sender: UIButton) {
        
        for button in buttons {
            updateButtonAppearance(button, selected: false)
        }
        
        updateButtonAppearance(sender, selected: true)
        
        let buttonTitle = sender.currentTitle ?? "0"
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        tip = buttonTitleAsANumber / 100
        
        textField.endEditing(true)
    }
    
    func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        
        numberOfPeople = Int(sender.value)
    }
    
    func calculatePressed() {
        
        let bill = textField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            
            let recalculateVC = RecalculateController()
            recalculateVC.result = resultTo2DecimalPlaces
            recalculateVC.split = numberOfPeople
            recalculateVC.tip = Int(tip * 100)
            
            present(recalculateVC, animated: true) {
                self.textField.text = ""
            }
        }
    }
    
}
