//
//  ServiceViewModel.swift
//  ZapisKZ
//
//  Created by Rauan on 5/15/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

struct ServiceViewModel {
    
    var name: String?
    var id: Int?
    var durationAndPrice: String?
    
    init(_ service: Service) {
        self.name = service.name
        self.id = service.id
        let price = service.price
        let maxPrice = service.priceMax == nil ? "" : " - \(service.priceMax ?? 0) ₸"
        self.durationAndPrice = "\(service.duration ?? 0) мин ・ \(price ?? 0) ₸\(maxPrice)"
    }
    
}
