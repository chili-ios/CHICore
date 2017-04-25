//
//  String+Classname.swift
//  TPP
//
//  Created by Mihails Tumkins on 13/12/16.
//  Copyright © 2016 Chili. All rights reserved.
//

import Foundation

public extension String {
    static func className(_ obj: AnyObject) -> String {
        return String(describing:obj.self).components(separatedBy: ".").last!
    }

    static func className(_ cls: AnyClass) -> String {
        return String(describing:cls).components(separatedBy: ".").last!
    }
}
