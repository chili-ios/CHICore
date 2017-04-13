//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation

open class UIEventBusEvent: PubSubEvent {

    public init() {}
    
    public class func eventName() -> String {
        return String(describing: self)
    }

    public func send() {
        UIEventBus.sharedInstance.send(event:self)
    }

}
