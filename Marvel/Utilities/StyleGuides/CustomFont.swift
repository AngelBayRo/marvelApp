//
//  CustomFont.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

struct CustomFont {
    
    var fontType: FontType
    var size: Size
    var style: Style
    
    init(fontType: FontType,
         size: Size = .medium,
         style: Style = .regular) {
        
        self.fontType = fontType
        self.size = size
        self.style = style
    }
}

extension CustomFont {
    
    enum FontType {
        case system
        case cartero
    }
    
    enum Size: CGFloat {
        case ultraSmall = 8
        case extraSmall = 10
        case small = 12
        case medium = 14
        case large = 16
        case extraLarge = 20
        case ultraLarge = 24
    }
    
    enum Style {
        case regular
        case bold
        case light
    }
}

extension CustomFont {
    
        var uiFont: UIFont {
            
            var name = ""
            
            switch self.fontType {
            case .system:
                return UIFont.systemFont(ofSize: self.size.rawValue)
                
            case .cartero:
                switch self.style {
                case .regular:
                    name = "Cartero-Regular"
                case .bold:
                    name = "Cartero-Bold"
                case .light:
                    name = "Cartero-Light"
                }
                
                return UIFont(name: name, size: self.size.rawValue) ?? UIFont.systemFont(ofSize: self.size.rawValue)
                
            }
            
        }
}
