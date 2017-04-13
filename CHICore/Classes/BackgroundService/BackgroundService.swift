//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation
import UIKit

public protocol PBackgroundService {
    var inBackground: Bool { get }
    var bgDate: NSDate? { get }
}

public class BackgroundService: PBackgroundService {

    private(set) open var inBackground: Bool = false
    private(set) open var bgDate: NSDate?

    public init() {
        registerForEvents()
    }

    private func registerForEvents() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(BackgroundService.onAppBecomeActive),
                                               name: NSNotification.Name.UIApplicationDidBecomeActive,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(BackgroundService.onAppDidEnterBackground),
                                               name:NSNotification.Name.UIApplicationDidEnterBackground,
                                               object: nil)
    }

    @objc private func onAppBecomeActive(notification: NSNotification) {
        if self.inBackground {
            let timeInBackground = NSDate.init().timeIntervalSince1970 - self.bgDate!.timeIntervalSince1970
            BGApplicationDidBecomeActiveEvent.init(fromBackground: self.inBackground, backgroundTime: timeInBackground).send()
        } else {
            BGApplicationDidBecomeActiveEvent.init(fromBackground: self.inBackground).send()
        }
        self.inBackground = false
    }

    @objc private func onAppDidEnterBackground (notification: NSNotification) {
        self.inBackground = true
        self.bgDate = NSDate.init()
        BGApplicationDidEnterBackgroundEvent.init().send()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
