//
//  API2Client+Audio.swift
//  TableExample
//
//  Created by Gleb on 09.04.17.
//  Copyright © 2017 Example. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

import ObjectMapper
import AlamofireObjectMapper

struct RequestInfo {
    var query: String?
    var method: String?
    var key = "711b23b60ff8da0c3aa2451ab3a6beb9"
    var ids: String?
    
    func toParams() -> Parameters {
        var params: Parameters = [:]
        
        if let query = query {
            params["method"] = method
            params["q"] = query
            params["ids"] = ids
            params["key"] = key
        }
        
        return params
    }
}

typealias ResponseClosure = (AudioListModel?, Bool, String?) -> Void
typealias AudioResponseClosure = (AudioModel?, Bool, String?) -> Void

extension API2Client {
    func audio(requestInfo: RequestInfo, completion: @escaping ResponseClosure) {
        let urlString = "http://api.xn--41a.ws/api.php"
            
        sessionManager?.request(urlString, method: .get, parameters: requestInfo.toParams(), encoding: URLEncoding.queryString, headers: nil).responseObject(completionHandler: {
            (response: DataResponse<AudioListModel>) in
            
            switch response.result {
            case.success( _):
                
                if let resValue = response.result.value {
                    completion(resValue, true, nil)
                }
            case .failure:
                completion(nil, false, NSLocalizedString("There was a network error. Please try again.", comment: ""))
            }
            
        })
    }
    
    func getAudio(requestInfo: RequestInfo, completion: @escaping AudioResponseClosure) {
        let urlString = "http://api.xn--41a.ws/api.php"
        
        sessionManager?.request(urlString, method: .get, parameters: requestInfo.toParams(), encoding: URLEncoding.queryString, headers: nil).responseObject(completionHandler: {
            (response: DataResponse<AudioModel>) in
            
            switch response.result {
            case.success( _):
                
                if let resValue = response.result.value {
                    completion(resValue, true, nil)
                }
            case .failure:
                completion(nil, false, NSLocalizedString("There was a network error. Please try again.", comment: ""))
            }
            
        })
    }
}
