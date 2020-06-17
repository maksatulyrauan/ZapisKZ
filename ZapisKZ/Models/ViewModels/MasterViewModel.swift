//
//  MasterViewModel.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

struct MasterViewModel {
    
    var avatarUrl: String?
    var name: String?
    var profession: String?
    var rating: String?
    
    init(_ master: Master) {
        self.avatarUrl = Constants.sharedInstance.apiEndpoint + (master.avatarUrl ?? "")
        self.name = master.name
        self.rating = master.rating != nil ? "\(master.rating!)" : nil
        self.profession = master.profession?.rawValue ?? "Неопределен"
    }
    
}
