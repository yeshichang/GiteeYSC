
//
//  UIWindow+Extentsion.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/23.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit

public extension UIWindow {
    
    public class func yscCurrentViewController() -> UIViewController {
        
        let window: UIWindow! = (UIApplication.shared.delegate?.window)!
        var topViewController: UIViewController! = window.rootViewController!
        while true {
            if ((topViewController.presentedViewController) != nil) {
                
                topViewController = topViewController.presentedViewController
                
            } else if (topViewController.isKind(of: UINavigationController.self)) {
                
                let tempVC: UINavigationController = topViewController as! UINavigationController
                
                if tempVC.topViewController != nil {
                    topViewController = tempVC
                }
                
            } else if (topViewController.isKind(of: UITabBarController.self)) {
                
                let tempVC: UITabBarController = topViewController as! UITabBarController
                
                if tempVC.selectedViewController != nil {
                    topViewController = tempVC
                }
                
            } else {
                
                break;
            }
        }
        return topViewController
    }
}
