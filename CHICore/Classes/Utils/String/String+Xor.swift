//
//  String+Xor.swift
//  Hippo
//
//  Created by Igors Nemenonoks on 24/11/16.
//  Copyright © 2016 Chili. All rights reserved.
//

import UIKit

extension String {
    func encodeWithXorByte(key: UInt8) -> String {
        return String(bytes: self.utf8.map {$0 ^ key}, encoding: String.Encoding.utf8) ?? ""
    }
}
