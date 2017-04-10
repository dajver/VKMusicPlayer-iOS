//
//  AudioModel.swift
//  TableExample
//
//  Created by Gleb on 10.04.17.
//  Copyright © 2017 Example. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

import ObjectMapper
import AlamofireObjectMapper

class AudioModel: Mappable {
    
    var item: [Any]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
    }
}
