//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation

class UIEventBusEvent: PubSubEvent {

    class func eventName() -> String {
        return String(describing: self)
    }

    open func send() {
        UIEventBus.sharedInstance.send(event:self)
    }

}
