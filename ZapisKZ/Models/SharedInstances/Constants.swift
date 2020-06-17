//
//  Constants.swift
//  ZapisKZ
//
//  Created by Rauan on 5/12/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

class Constants: NSObject {

    static let sharedInstance = Constants()

    var apiEndpoint = "http://zp.jgroup.kz/"
    var padding: CGFloat {
        return UIApplication.shared.windows[0].frame.width * 0.02
    }
}
