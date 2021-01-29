//
//  Double+Extension.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    
    func formatCurrency(showSign: Bool = false, currencySymbol: String? = nil, numberOfDecimales: Int = 0) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = numberOfDecimales
        
        if let currencySymbol = currencySymbol {
            
            formatter.currencySymbol = currencySymbol
            formatter.numberStyle = .currency
        }
        
        formatter.locale = Locale(identifier: Locale.current.identifier)
        let result = formatter.string(from: self as NSNumber)
        
        if showSign {
            
            if self >= 0 {
                
                return "+".appending(result!)
            }
        }
        
        return result!
    }
    
    func round(numberOfDecimales: Int) -> String {
        return self.formatCurrency(showSign: false, currencySymbol: nil, numberOfDecimales: numberOfDecimales)
    }
    
    func moneyFormattedString() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSize = 3
        numberFormatter.decimalSeparator = ","
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.positiveSuffix = "€"
        numberFormatter.negativeSuffix = "€"
        return numberFormatter.string(for: self as NSNumber)
    }
    
    func percentFormattedString() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = false
        numberFormatter.groupingSize = 3
        numberFormatter.decimalSeparator = ","
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.positiveSuffix = "%"
        numberFormatter.negativeSuffix = "%"
        return numberFormatter.string(for: self as NSNumber)
    }
}
