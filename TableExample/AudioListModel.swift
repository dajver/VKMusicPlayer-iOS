//
//  AudioListModel.swift
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

class AudioListModel: Mappable {
    
    var list: [[Any]]?
    var audio: [[Any]]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        list <- map["list"]
        audio <- map
    }
}
