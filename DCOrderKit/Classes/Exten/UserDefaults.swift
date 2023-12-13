//
//  UserDefaults.swift
//  DCOrderKit_Example
//
//  Created by 熊兵 on 2023/12/13.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

extension UserDefaults {

    var userId: String? {
        get {
            return UserDefaults.standard.value(forKey: "loginSaveUserId") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "loginSaveUserId")
            UserDefaults.standard.synchronize()
        }
    }
    
    var token: String? {
        get {
            return UserDefaults.standard.value(forKey: "loginSaveToken") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "loginSaveToken")
            UserDefaults.standard.synchronize()
        }
    }
}
