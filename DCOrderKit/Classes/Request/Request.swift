//
//  Request.swift
//  DCOrderKit_Example
//
//  Created by 熊兵 on 2023/12/13.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

typealias Parmeter = (key: String, value: Any?, sign: Bool)
struct Request {
    private var defalut: [Parmeter] {
        var signs: [Parmeter] = []
        signs.append(Parmeter("appId",Service.defalutService.data.AppId,true))
        signs.append(Parmeter("deviceId",UIDevice().udid, true))
        signs.append(Parmeter("os","2", true))
        signs.append(Parmeter("channel","app_store",true))
        signs.append(Parmeter("version","2.0",true))
        signs.append(Parmeter("clientTime","\(Date.timeStamp)",true))
        signs.append(Parmeter("nonce",String.NonceString,true))
        return signs
    }
    
    var parmeter: [Parmeter] {
        var notsigns: [Parmeter] = []
        notsigns.append(Parmeter("userId",UserDefaults.standard.userId,false))
        notsigns.append(Parmeter("token",UserDefaults.standard.token,false))
        notsigns.append(Parmeter("clientLanguage","es",false))
        notsigns.append(Parmeter("clientVersion",NSString.version(),false))
        return notsigns
    }
    
    var Body : [String: Any] = [:]
    public var BParmeter: [Parmeter] = [] {
        didSet { addSign() }
    }
    
    public var deviceInfo: [String: Any]? {
        didSet { addSign() }
    }
    public var contactInfo: [[String: Any]]? {
        didSet { addSign() }
    }
    
    // TODO: Add Sign For Parmeter
    mutating func addSign() {
        var allsign = defalut
        allsign.append(contentsOf: BParmeter.filter { $0.sign })
        
        var sign_strs = allsign.map { "\($0.key)=\($0.value as? String ?? "")" }
        sign_strs.sort()
        
        let sign = (sign_strs.joined(separator: "&").md5.uppercased() + Service.defalutService.data.Salt).md5.uppercased()
        
        Body["sign"] = sign
        [allsign, parmeter].forEach { P in P.forEach { parmeter in Body[parmeter.key] = parmeter.value } }
        // set data
        var requestParmeter : [String: Any] = [:]
        BParmeter.forEach { p in requestParmeter[p.key] = p.value }
        if let deviceInfo = deviceInfo { deviceInfo.forEach { p in requestParmeter[p.key] = p.value } }
        if let contactInfo = contactInfo { requestParmeter["list"] = contactInfo }
        Body["data"] = requestParmeter
    }
}
