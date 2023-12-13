//
//  String.swift
//  DCOrderKit_Example
//
//  Created by 熊兵 on 2023/12/13.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    // TODO: Get Random Str
    static var NonceString: String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let charactersCount = UInt32(characters.count)
        var randomString = ""
        for _ in 0..<16 {
            let randomIndex = Int(arc4random_uniform(charactersCount))
            let randomCharacter = characters[characters.index(characters.startIndex, offsetBy: randomIndex)]
            randomString.append(randomCharacter)
        }
        return randomString
    }
    
    
    var md5: String {
        get {
            let length = Int(CC_MD5_DIGEST_LENGTH)
            let messageData = self.data(using: .utf8)!
            var digestData = Data(count: length)
            
            _ = digestData.withUnsafeMutableBytes { digestBytes in
                messageData.withUnsafeBytes { messageBytes in
                    CC_MD5(messageBytes.baseAddress, CC_LONG(messageData.count), digestBytes.bindMemory(to: UInt8.self).baseAddress)
                }
                
            }
            return digestData.map { String(format: "%02hhx", $0) }.joined()
        }
    }
}
