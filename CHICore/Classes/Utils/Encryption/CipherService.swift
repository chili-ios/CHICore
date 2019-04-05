//
//  CypherService.swift
//  CHICore
//
//  Created by McSims on 05/04/2019.
//

import Foundation

public final class CipherService {
    private static let salt = [UInt8](repeating: 1, count: 255)

    public final class func encrypt(string: String) -> String {
        let text = [UInt8](string.utf8)
        var encrypted = [UInt8]()
        for (i, v) in text.enumerated() {
            encrypted.append(v ^ salt[i])
        }

        let data = Data(bytes: encrypted)
        return data.base64EncodedString()
    }

    public final class func decrypt(string: String) -> String? {
        guard let data = Data(base64Encoded: string) else { return nil }
        let encrypted = [UInt8](data)
        var decrypted = [UInt8]()

        for (i, v) in encrypted.enumerated() {
            decrypted.append(v ^ salt[i])
        }
        return String(bytes: decrypted, encoding: .utf8)
    }
}
