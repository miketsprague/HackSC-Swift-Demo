//
//  YourDataModel.swift
//  SwiftDemo
//
//  Created by Mike Sprague on 11/4/14.
//  Copyright (c) 2014 Guidebook. All rights reserved.
//

import Foundation
import SwiftyJSON

class YourDataModel {
    let name : String
    
    
    init(jsonData: JSON) {
        self.name = jsonData["name"].stringValue
    }
}