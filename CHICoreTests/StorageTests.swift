//
//  StorageTests.swift
//  CHICore
//
//  Created by Igors Nemenonoks on 12/04/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import XCTest

class StorageTests: XCTestCase {
    
    var storage = PrefrencesStorage()
    
    func testInt() {
        let anInt: Int = 5
        storage.store(anInt, key: "int")
        guard let restoredInt: Int = storage.restore(key: "int") else {
            XCTFail("unable to restore int")
            return
        }
        XCTAssert(anInt == restoredInt)
    }
    
    func testString() {
        let aString: String = "aString"
        storage.store(aString, key: "string")
        guard let restoredString: String = storage.restore(key: "string") else {
            XCTFail("unable to restore string")
            return
        }
        XCTAssert(aString == restoredString)
    }
    
    func testDouble() {
        let aVal: Double = 5
        storage.store(aVal, key: "double")
        guard let restoredVal: Double = storage.restore(key: "double") else {
            XCTFail("unable to restore double")
            return
        }
        XCTAssert(aVal == restoredVal)
    }
    
    func testBool() {
        let aVal: Bool = true
        storage.store(aVal, key: "bool")
        guard let restoredVal: Bool = storage.restore(key: "bool") else {
            XCTFail("unable to restore bool")
            return
        }
        XCTAssert(aVal == restoredVal)
    }
    
    func testFloat() {
        let aVal: Float = 3
        storage.store(aVal, key: "float")
        guard let restoredVal: Float = storage.restore(key: "float") else {
            XCTFail("unable to restore float")
            return
        }
        XCTAssert(aVal == restoredVal)
    }

    func testTypes() {
        if let _: String = storage.restore(key: "unknownKey") {
            XCTFail("should be nil")
        }
        let anInt: Int = 5
        storage.store(anInt, key: "int")
    }
    
}
