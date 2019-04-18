//
//  DeviceUtils.swift
//  CHICore
//
//  Created by McSims on 05/04/2019.
//

import Foundation
import Device

public protocol PDeviceUtils {
    static var isIPhone4: Bool { get }
    static var isIPhone5: Bool { get }
    static var isSmallDevice: Bool { get }
    static var isPhone: Bool { get }
    static var isPad: Bool { get }
    static var isIPhoneX: Bool { get }
    static var isIphone4s: Bool { get }
    static var isIphoneSEOrSmaller: Bool { get }
}

public struct DeviceUtils: PDeviceUtils {

    public static var isIPhone4: Bool {
        return Device.size() == .screen3_5Inch
    }

    public static var isIPhone5: Bool {
        return Device.size() == .screen4Inch
    }

    public static var isSmallDevice: Bool {
        return DeviceUtils.isIPhone4 || DeviceUtils.isIPhone5
    }

    public static var isPhone: Bool {
        return UI_USER_INTERFACE_IDIOM() == .phone
    }

    public static var isPad: Bool {
        return UI_USER_INTERFACE_IDIOM() == .pad
    }

    public static var isIPhoneX: Bool {
        return Device.size() == .screen5_8Inch
    }

    public static var isIphone4s: Bool {
        return Device.size() == .screen3_5Inch
    }

    public static var isIphoneSEOrSmaller: Bool {
        return Device.size() <= .screen4Inch
    }
}
