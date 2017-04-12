//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation

public class BGApplicationDidBecomeActiveEvent: BGEventBusEvent {

    open var fromBackground: Bool = false
    open var backgroundTime: TimeInterval?

    public init(fromBackground: Bool) {
        self.fromBackground = fromBackground
    }

    public init(fromBackground: Bool, backgroundTime: TimeInterval) {
        self.fromBackground = fromBackground
        self.backgroundTime = backgroundTime
    }

}
