//
//  DataHolder.swift
//  ZapisKZ
//
//  Created by Rauan on 5/13/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class DataHolder: NSObject {

    static let sharedInstance = DataHolder()

    var recommendedFirms = [Firm]()
    var popularFirms = [Firm]()
    var recentlyAddedFirms = [Firm]()
    var safeAreaOnTopHeight: CGFloat = 0
    var bottomSafeAreaHeight: CGFloat = 0
}
