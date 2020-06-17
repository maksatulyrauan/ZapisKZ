//
//  FirmViewModel.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

struct FirmViewModel {
    
    var imageUrl: String?
    var name: String?
    var address: String?
    var type: String?
    var rating_str: String?
    var rating_fl: Float?
    var category: String?
    var reviewCount: String?
    var location: Location?
    
    init(_ firm: Firm, _ location: Location? = nil) {
        self.location = location
        self.imageUrl = Constants.sharedInstance.apiEndpoint + (firm.pictureUrl ?? "")
        self.name = firm.name
        self.address = firm.address?.replacingOccurrences(of: "<br />", with: "\n")
        self.rating_fl = firm.averageRating
        self.rating_str = "\(firm.averageRating ?? 0.0)"
        self.reviewCount = constructReviewsText(reviewsCount: firm.reviewCount ?? 0)
        switch firm.type {
        case .BEAUTY_SHOP:
            self.type = "Салон красоты"
        case .BEAUTY_STUDIO:
            self.type = "Студия красоты"
        case .ESTETIC_CENTER:
            self.type = "Эстетический центр"
        default:
            break
        }
        
        switch firm.category {
        case .SALON:
            self.category = "SALON"
        default:
            break
        }
    }
    
    func constructReviewsText(reviewsCount: Int) -> String {
        if(reviewsCount == 0) {
          return "";
        }
        else if(reviewsCount > 4 && reviewsCount < 21) {
          return "\(reviewsCount) отзывов"
        }
        else if(reviewsCount % 10 == 1) {
          return "\(reviewsCount) отзыв"
        }
        else if(reviewsCount % 10 < 5) {
          return "\(reviewsCount) отзыва"
        }
        else {
          return "\(reviewsCount) отзывов"
        }
    }
    
}
