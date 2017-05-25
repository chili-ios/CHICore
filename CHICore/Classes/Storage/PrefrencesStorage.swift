//
// Created by Igors Nemenonoks on 12/02/16.
// Copyright (c) 2016 Chili. All rights reserved.
//

import Foundation

public protocol PrefrenceStorable {
}
public protocol PPrefrencesStorage {
    func remove(key: String)
    func store(_ value: PrefrenceStorable, key: String)
    func restore<T>(key: String) -> T? where T: PrefrenceStorable
}

public class PrefrencesStorage: PPrefrencesStorage {
    private let defaults = UserDefaults(suiteName: "group."+Bundle.main.bundleIdentifier!)
    
    public init() { }

    open func remove(key: String) {
        self.defaults?.removeObject(forKey: key)
    }

    open func store(_ value: PrefrenceStorable, key: String) {
        self.defaults?.set(value, forKey:key)
    }

    open func restore<T>(key: String) -> T? where T: PrefrenceStorable {
        return self.defaults?.object(forKey: key) as! T?
    }

    open func registerDefaults(_ defaults: [String : PrefrenceStorable]) {
        self.defaults?.register(defaults: defaults)
    }
}

extension Int: PrefrenceStorable { }
extension String: PrefrenceStorable { }
extension Double: PrefrenceStorable { }
extension Float: PrefrenceStorable { }
extension Bool: PrefrenceStorable { }
