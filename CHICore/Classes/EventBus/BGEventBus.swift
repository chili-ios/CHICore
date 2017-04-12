//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation

class BGEventBus: EventBus {

    static let sharedInstance = BGEventBus()

    init() {
        super.init(queue: OperationQueue())
    }

}
