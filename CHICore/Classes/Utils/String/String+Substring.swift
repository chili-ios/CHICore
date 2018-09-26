//
//  String+Substring.swift
//  TPP
//
//  Created by Mihails Tumkins on 28/12/16.
//  Copyright © 2016 Chili. All rights reserved.
//

import Foundation

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(with range: Range<Int>) -> String {
        let safeRange = Range(uncheckedBounds: (lower: self.count < range.lowerBound ? self.count : range.lowerBound,
                                                upper: self.count < range.upperBound ? self.count : range.upperBound))
        let startIndex = index(from: safeRange.lowerBound)
        let endIndex = index(from: safeRange.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
