//
//  ObjectModel.swift
//  CubicWeightCalculator
//
//  Created by Nafisa Rahman on 11/16/19.
//  Copyright © 2019 com.nafisa. All rights reserved.
//

import Foundation

struct Size: Decodable {
    var width: Double
    var height: Double
    var length: Double
}

struct Object: Decodable {
    var category: String
    var size: Size?
}

struct ObjectModel: Decodable {
    let objects : [Object]
    var next: String?
}
