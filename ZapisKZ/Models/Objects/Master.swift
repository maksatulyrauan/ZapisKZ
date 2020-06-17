//
//  Master.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

class Master: Decodable {

    var id: Int!
    var name: String?
    var surname: String?
    var profession: ProfessionType?
    var avatarUrl: String?
    var serviceIds: [Int]
    var rating: Int?
    var experience: String?
    var isRoom: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatarUrl
        case surname
        case profession
        case serviceIds
        case rating
        case experience
        case isRoom
    }


    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try? container.decode(Int.self, forKey: .id)
        self.name = try? container.decode(String.self, forKey: .name)
        self.avatarUrl = try? container.decode(String.self, forKey: .avatarUrl)
        self.surname = try? container.decode(String.self, forKey: .surname)
        self.profession = ProfessionType.init(rawValue: try container.decode(String.self, forKey: .profession))
        self.serviceIds = try container.decode([Int].self, forKey: .serviceIds)
        self.rating = try? container.decode(Int.self, forKey: .rating)
        self.experience = try? container.decode(String.self, forKey: .experience)
        self.isRoom = try? container.decode(Bool.self, forKey: .isRoom)
    }
}
