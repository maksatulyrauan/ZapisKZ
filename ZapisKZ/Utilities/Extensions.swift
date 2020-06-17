//
//  Extensions.swift
//  ZapisKZ
//
//  Created by Rauan on 5/12/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import UIKit

extension UILabel {
    func setSize(_ size: Int) {
        font = font.withSize(CGFloat(size))
    }
    
    func setParams(font: FontType, size: CGFloat, textColor: UIColor) {
        switch font {
        case .BOLD:
            self.font = UIFont(name: "Montserrat-Bold", size: size)
        case .SEMIBOLD:
            self.font = UIFont(name: "Montserrat-SemiBold", size: size)
        case .MEDIUM:
            self.font = UIFont(name: "Montserrat-Medium", size: size)
        case .REGULAR:
            self.font = UIFont(name: "Montserrat-Regular", size: size)
        case .LIGHT:
            self.font = UIFont(name: "Montserrat-Light", size: size)
        }
        self.textColor = textColor
    }
}
extension UIColor {

    static var appYellow: UIColor = {
        return UIColor().colorFromHexString("FFC107")
    }()
    static var appLightGray: UIColor = {
        return UIColor().colorFromHexString("e8eaed")
    }()
    static var appGray: UIColor = {
        return UIColor().colorFromHexString("818c94")
    }()
    static var appPurple: UIColor = {
        return UIColor().colorFromHexString("4f7bc2")
    }()
    
    func colorFromHexString (_ hex:String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
extension UIViewController {
    func getSafeAreaFrame() {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            let safeFrame = window.safeAreaLayoutGuide.layoutFrame
            DataHolder.sharedInstance.safeAreaOnTopHeight = safeFrame.minY
            DataHolder.sharedInstance.bottomSafeAreaHeight = window.frame.maxY - safeFrame.maxY
        }
    }
}

extension UIApplication {

    var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

            if let statusBar = keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let view = UIView(frame: (keyWindow?.windowScene?.statusBarManager!.statusBarFrame)!)
                view.tag = tag
                keyWindow?.addSubview(view)
                return view
            }
        } else {
            return value(forKey: "statusBar") as? UIView
        }
    }
}
