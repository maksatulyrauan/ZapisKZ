//
//  Service.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

class Service: Decodable {

    var id: Int?
    var name: String?
    var description: String?
    var price: Int?
    var priceMax: Int?
    var duration: Int?
    var express: Int?
    var prepaymentAmount: Int?
    var priceStr: String?
    var categoryId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case priceMax
        case duration
        case express
        case prepaymentAmount
        case priceStr
        case categoryId
    }


    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try? container.decode(Int.self, forKey: .id)
        self.name = try? container.decode(String.self, forKey: .name)
        self.description = try? container.decode(String.self, forKey: .description)
        
        self.price = try? container.decode(Int.self, forKey: .price)
        self.priceMax = try? container.decode(Int.self, forKey: .priceMax)
        self.duration = try? container.decode(Int.self, forKey: .duration)
        self.express = try? container.decode(Int.self, forKey: .express)
        self.prepaymentAmount = try? container.decode(Int.self, forKey: .prepaymentAmount)
        self.priceStr = try? container.decode(String.self, forKey: .priceStr)
        self.categoryId = try? container.decode(Int.self, forKey: .categoryId)

    }
}
