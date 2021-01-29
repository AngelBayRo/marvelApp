//
//  NSAttributedString+Extension.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
//swiftlint:disable legacy_constructor

extension NSMutableAttributedString {
    
    static func localizeWithParams(string: NSMutableAttributedString, stringsToReplace: [NSMutableAttributedString]) -> NSMutableAttributedString {

        var string = string
        let pattern = "%@"
        let arrayOcurrencies =  string.splitAttributedString(separatedBy: pattern)
        for index in 0..<arrayOcurrencies.count {

            if !stringsToReplace.indices.contains(index) { break }
            let range = NSString(string: string.string).range(of: pattern)
            string = NSMutableAttributedString(string: string.mutableString.replacingOccurrences(of: pattern, with: stringsToReplace[index].string, options: .literal, range: range))
        }
        return string
    }
    
    func splitAttributedString(separatedBy: String) -> [NSAttributedString] {
        let input = self.string
        let separatedInput = input.components(separatedBy: separatedBy)
        var output = [NSAttributedString]()
        var start = 0
        for sub in separatedInput {
            let range = NSMakeRange(start, sub.count)
            let attribStr = self.attributedSubstring(from: range)
            output.append(attribStr)
            start += range.length + separatedBy.count
        }
        return output
    }
}
