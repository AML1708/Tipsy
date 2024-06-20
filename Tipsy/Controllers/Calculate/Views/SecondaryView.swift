//
//  SecondaryView.swift
//  Tipsy
//
//  Created by Alexander on 20.06.24.
//

import UIKit

final class SecondaryView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension SecondaryView {
    func configure() {
        backgroundColor = Resources.Colors.greenBackground
    }
}
