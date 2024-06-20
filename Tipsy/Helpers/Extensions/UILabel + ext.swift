//
//  UILabel + ext.swift
//  Tipsy
//
//  Created by Alexander on 20.06.24.
//

import UIKit

extension UILabel {
    func createLabel(_ title: String, fontSize: CGFloat) {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textAlignment = .center
        label.font = Resources.Fonts.systemRegular(with: fontSize)
        label.textColor = Resources.Colors.titleGray
    }
}
