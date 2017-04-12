//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation

class UIEventBus: EventBus {

    static let sharedInstance = UIEventBus()

    init() {
        super.init(queue: OperationQueue.main)
    }
}
