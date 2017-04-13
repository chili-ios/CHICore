//
// Created by Igors Nemenonoks on 31/08/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import UIKit

open class ViewAnimationsUtils {
    public static func shakeView(view: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.06
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x:view.center.x - 10, y:view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x:view.center.x + 10, y:view.center.y))
        view.layer.add(animation, forKey: "position")
    }
}

extension UIView {
    public static func viewFromXib(xibName: String) -> UIView? {
        return UINib(nibName: xibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}
