//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation

public protocol PEventBus {
    var queue: OperationQueue { get }
}

public class EventBus: PEventBus {

    private(set) open var queue: OperationQueue

    init(queue: OperationQueue) {
        self.queue = queue
    }

    public func send(event: AnyObject) {
        self.queue.addOperation {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:String.className(event)), object: event)
        }
    }

    public func handleEvent<T: PubSubEvent>(target: EventBusObservable, handleBlock: @escaping ((T) -> Swift.Void)) {
        let notificationName = NSNotification.Name(rawValue: T.eventName())
        _ = target.eventBusObserver.addObserver(forName: notificationName, object: nil, queue: self.queue) { (notification) in
            handleBlock((notification.object as! T))
        }
    }

}

public class EventBusObserver {

    var objectProtocol: NSObjectProtocol?
    
    public init() {
        
    }

    open func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> Swift.Void) {
        self.objectProtocol = NotificationCenter.default.addObserver(forName: name, object: obj, queue: queue, using: block)
    }

    deinit {
        if let obj = self.objectProtocol {
            NotificationCenter.default.removeObserver(obj)
        }
        self.objectProtocol = nil
    }
}

public protocol EventBusObservable {
    var eventBusObserver: EventBusObserver { get set }
    func handleBGEvent<T>(handleBlock: @escaping ((T) -> Swift.Void)) where T : BGEventBusEvent
    func handleUIEvent<T>(handleBlock: @escaping ((T) -> Swift.Void)) where T : UIEventBusEvent
}

extension EventBusObservable {
    public func handleBGEvent<T>(handleBlock: @escaping ((T) -> Void)) where T : BGEventBusEvent {
        BGEventBus.sharedInstance.handleEvent(target: self, handleBlock: handleBlock)
    }

    public func handleUIEvent<T>(handleBlock: @escaping ((T) -> Swift.Void)) where T : UIEventBusEvent {
        UIEventBus.sharedInstance.handleEvent(target: self, handleBlock: handleBlock)
    }
}
