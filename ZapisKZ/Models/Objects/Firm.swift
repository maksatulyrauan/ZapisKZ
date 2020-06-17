//
//  Firm.swift
//  ZapisKZ
//
//  Created by Rauan on 5/13/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

class Firm: Decodable {

    var id: Int!
    var name: String?
    var address: String?
    var type: FirmType?
    var checkRating: Int?
//    let urlKey: String?
    var isPromoted: Bool?
    var avatarUrl: String?
    var isIndividualMaster: Bool?
    var workSchedule: String?
    var pictureUrl: String?
    var averageRating: Float?
    var prepaymentCashbackAmount: String?
    var todayReservationsCount: Int?
    var isFavorite: Bool?
    //Details
    var phoneNumbers: [String]?
    var pictures: [String]?
    var reviewCount: Int?
    var workStartTime: String?
    var workEndTime: String?
    var description: String?
    var isExpress: Bool?
    var category: FirmCategory?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case type
        case checkRating
        case isPromoted
        case avatarUrl
        case isIndividualMaster
        case workSchedule
        case pictureUrl
        case averageRating
        case prepaymentCashbackAmoun
        case todayReservationsCount
        case isFavorite
        //Details
        case phoneNumbers
        case pictures
        case workStartTime
        case workEndTime
        case description
        case isExpress
        case category
        case reviewCount
    }


    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try? container.decode(Int.self, forKey: .id)
        self.name = try? container.decode(String.self, forKey: .name)
        self.address = try? container.decode(String.self, forKey: .address)
        self.type = FirmType(rawValue: try! container.decode(String.self, forKey: .type))
        self.checkRating = try? container.decode(Int.self, forKey: .checkRating)
        self.isPromoted = try? container.decode(Bool.self, forKey: .isPromoted)
        self.avatarUrl = try? container.decode(String.self, forKey: .avatarUrl)
        self.isIndividualMaster = try? container.decode(Bool.self, forKey: .isIndividualMaster)
        self.workSchedule = try? container.decode(String.self, forKey: .workSchedule)
        self.pictureUrl = try? container.decode(String.self, forKey: .pictureUrl)
        self.averageRating = try? container.decode(Float.self, forKey: .averageRating)
        self.prepaymentCashbackAmount = try? container.decode(String.self, forKey: .prepaymentCashbackAmoun)
        self.todayReservationsCount = try? container.decode(Int.self, forKey: .todayReservationsCount)
        self.isFavorite = try? container.decode(Bool.self, forKey: .isFavorite)
        //Details
        self.phoneNumbers = try? container.decode([String].self, forKey: .phoneNumbers)
        self.pictures = try? container.decode([String].self, forKey: .pictures)
        self.workStartTime = try? container.decode(String.self, forKey: .workStartTime)
        self.workEndTime = try? container.decode(String.self, forKey: .workEndTime)
        self.reviewCount = try? container.decode(Int.self, forKey: .reviewCount)
        self.description = try? container.decode(String.self, forKey: .description)
        self.isExpress = try? container.decode(Bool.self, forKey: .isExpress)
        let category = try? container.decode(String.self, forKey: .category)
        self.category = FirmCategory(rawValue: category ?? FirmCategory.SALON.rawValue)
    }
}
