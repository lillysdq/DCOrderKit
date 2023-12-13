//
//  Service.swift
//  DCOrderKit_Example
//
//  Created by 熊兵 on 2023/12/13.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation


typealias ServiceData = (baseUrl:String, AppId:String, Salt:String, adToken: String, adType: String)
enum Service {
    case developForTest
    case developForProduct
    
    var data: ServiceData {
        switch self {
        case .developForTest:
            return ("https://test-api.crosscheckcash.vip","crosscheckcash","lmELOEGsOEGETtVD","","sandbox")
        case .developForProduct:
            return ("https://api.crosscheckcash.vip","crosscheckcash","90Ozx6sjBCh0XUR1","","production")
        }
    }
    static let defalutService: Service = .developForTest
}
