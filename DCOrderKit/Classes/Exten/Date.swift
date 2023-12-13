//
//  Date.swift
//  DCOrderKit_Example
//
//  Created by 熊兵 on 2023/12/13.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

extension Date {
    static var timeStamp: Int64 {
        get {
            let currentTime = Date().timeIntervalSince1970
            let timestamp = Int64(currentTime * 1000)
            return timestamp
        }
    }
}
