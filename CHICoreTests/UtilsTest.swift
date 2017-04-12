//
//  UtilsTest.swift
//  CHICore
//
//  Created by Igors Nemenonoks on 12/04/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import XCTest

class SomeClass {
    
}

class UtilsTest: XCTestCase {
    
    func testClassName() {
        XCTAssert(String.className(SomeClass.self) == "SomeClass", "wrong class name")
        let obj = SomeClass()
        XCTAssert(String.className(obj) == "SomeClass", "wrong class name")
    }
    
    func testSubstrings() {
        XCTAssert("Some string".substring(from: 5) == "string")
        XCTAssert("Some string".substring(with: 0..<4) == "Some")
    }
    
    func testXor() {
        XCTAssert("{|zafo".encodeWithXorByte(key: 8) == "string")
    }

}
