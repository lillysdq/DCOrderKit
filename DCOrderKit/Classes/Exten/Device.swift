//
//  Device.swift
//  DCOrderKit_Example
//
//  Created by 熊兵 on 2023/12/13.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Security

extension UIDevice {
    var udid: String {
        get {
            if let tempUdid = getStringFromKeychain(service: "saveForUdidKey", key: "saveForUdidValue") {
                return tempUdid
            }

            let newUDID = UUID().uuidString
            if saveStringToKeychain(service: "saveForUdidKey", key: "saveForUdidValue", value: newUDID) {
                return newUDID
            }
            return ""
        }
    }
    private func saveStringToKeychain(service: String, key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]
            
            let status = SecItemAdd(query as CFDictionary, nil)
            return status == errSecSuccess
        }
        return false
    }
    
    func getStringFromKeychain(service: String, key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess, let data = result as? Data, let value = String(data: data, encoding: .utf8) {
            return value
        }
        return nil
    }
}
