//
//  ViewHelpers.swift
//  TPP
//
//  Created by Mihails Tumkins on 14/12/16.
//  Copyright © 2016 Chili. All rights reserved.
//

import UIKit

extension UIView {
    public func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
