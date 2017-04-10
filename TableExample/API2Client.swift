//
//  API2Client.swift
//  MovieApp
//
//  Created by Pavel Borisov on 11/30/16.
//  Copyright © 2016 Pavel Borisov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SystemConfiguration

typealias BaseClosure = (Bool, String?) -> Void

class API2Client {
    
    var sessionManager: SessionManager?
    
    static let shared: API2Client = {
        let instance = API2Client()
        
        instance.sessionManager = SessionManager()

        
        return instance
    }()
    
    
    func connectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
