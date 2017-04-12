//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation

public protocol PubSubEvent {
    static func eventName() -> String
    func send()
}
