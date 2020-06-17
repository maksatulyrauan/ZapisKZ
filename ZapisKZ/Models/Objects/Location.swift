//
//  Location.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

class Location: Decodable {

    var markerX: Float?
    var markerY: Float?
    var centerX: Float?
    var centerY: Float?
    var zoom: Int?
    
    enum CodingKeys: String, CodingKey {
        case markerX
        case markerY
        case centerX
        case centerY
        case zoom
    }


    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.markerX = try? container.decode(Float.self, forKey: .markerX)
        self.markerY = try? container.decode(Float.self, forKey: .markerY)
        self.centerX = try? container.decode(Float.self, forKey: .centerX)
        
        self.centerY = try? container.decode(Float.self, forKey: .centerY)
        self.zoom = try? container.decode(Int.self, forKey: .zoom)

    }
}
