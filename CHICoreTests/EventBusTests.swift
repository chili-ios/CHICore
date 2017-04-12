//
//  EventBusTests.swift
//  CHICore
//
//  Created by Igors Nemenonoks on 12/04/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import XCTest

class EventBusTests: XCTestCase, EventBusObservable {
    
    var eventBusObserver = EventBusObserver()
    
    func testBGEvent() {
        let exp = expectation(description: "event")
        self.handleBGEvent { (event: BGEventBusEvent) in
            exp.fulfill()
        }
        BGEventBusEvent().send()
        
        wait(for: [exp], timeout: 2)
    }
    
    func testUIEvent() {
        let exp = expectation(description: "event")
        self.handleUIEvent { (event: UIEventBusEvent) in
            exp.fulfill()
        }
        UIEventBusEvent().send()
        
        wait(for: [exp], timeout: 2)
        
    }
    
}
