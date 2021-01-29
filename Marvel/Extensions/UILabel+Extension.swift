//
//  UILabel+Extension.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
    
    // Method to highlight specific strings
    func highlightSubstring(string: String, font: UIFont, color: UIColor) {
        
        let range = (self.text! as NSString).range(of: string)
        let attributedSecondLabel = NSMutableAttributedString(string: self.text!)
        attributedSecondLabel.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        attributedSecondLabel.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        self.attributedText = attributedSecondLabel
        
    }
}
