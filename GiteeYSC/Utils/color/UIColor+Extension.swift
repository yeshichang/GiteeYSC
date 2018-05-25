//
//  UIColor+Extension.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/22.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit

public extension UIColor {
    public class func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a:CGFloat = 1) -> UIColor {
        return UIColor.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    public class func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(255))
        let green = CGFloat( arc4random_uniform(255))
        let blue = CGFloat(arc4random_uniform(255))
        let alpha = CGFloat(arc4random_uniform(11))
        return UIColor.rgba(r: red, g: green, b: blue, a: alpha)
    }
    
    /// 16进制颜色
    public class func hexColor(_ color: String, alpha: CGFloat = 1) -> UIColor {
        var cString = color.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() as NSString
        let len = cString.length
        if len < 6 {
            return UIColor.white
        }
        if cString.hasPrefix("#") {
            cString = cString.substring(from: 1) as NSString
        }
        if cString.length != 6 {
            return UIColor.white
        }
        var range: NSRange!
        range.location = 0
        range.length = 2
        let rString = cString.substring(with: range)
        
        range.location = 2;
        let gString = cString.substring(with: range)
        
        range.location = 4;
        let bString = cString.substring(with: range)
        
        var r, g, b: Int?
        Scanner.init(string: rString).scanInt(&r!)
        Scanner.init(string: gString).scanInt(&g!)
        Scanner.init(string: bString).scanInt(&b!)
        
        return UIColor.rgba(r: CGFloat(r!), g: CGFloat(g!), b: CGFloat(b!), a: alpha)
    }
}
