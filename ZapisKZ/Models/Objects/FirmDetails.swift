//
//  FirmDetails.swift
//  ZapisKZ
//
//  Created by Rauan on 5/14/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

class FirmDetails: NSObject {

    var firm: Firm?
    var masters = [Master]()
    var services = [Service]()
    var categories = [Category]()
    var location: Location?
}
