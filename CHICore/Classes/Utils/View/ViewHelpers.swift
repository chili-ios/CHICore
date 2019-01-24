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

    public static func viewFromXib<T: UIView>(_ aBundle: Bundle? = nil) -> T {
        return UINib(nibName: String.className(T.self), bundle: aBundle).instantiate(withOwner: nil, options: nil)[0] as! T
    }
}
