//
//  Category.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

class Category: Decodable {

    var id: Int?
    var name: String?
    var isSelected = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }


    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try? container.decode(Int.self, forKey: .id)
        self.name = try? container.decode(String.self, forKey: .name)

    }
}
