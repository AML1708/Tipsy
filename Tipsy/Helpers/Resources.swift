//
//  Resources.swift
//  Tipsy
//
//  Created by Alexander on 20.06.24.
//

import UIKit

enum Resources {
    enum Colors {
        static var greenBackground = UIColor(hexString: "#D7F9EB")
        static var background = UIColor(hexString: "#F9FFFD")
        static var greenButton = UIColor(hexString: "#09AF6B")
        
        static var titleGray = UIColor(hexString: "#AAAAAA")
    }
    
    enum String {
        enum Calculate {
            static var enterBillTotal = "Enter bill total"
            static var selectTip = "Select tip"
            static var chooseSplit = "Choose Split"
            static var calculate = "Calculate"
            static var placeholder = "e.g. 123.56"
        }
        
        enum Recalculate {
            static var totalPerPerson = "Total per person"
            static var recalculate = "Recalculate"
        }
    }
    
    enum Fonts {
        static func systemRegular(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size)
        }
    }
}
