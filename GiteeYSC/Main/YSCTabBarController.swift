//
//  YSCTabBarController.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/22.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit

class YSCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViewControllers() {
        
        
        let homeVC = navigationCotrollerWithViewController(viewController: YSCHomeViewController.init(),
                                                           title: "主页", normalImage: "tabbar_home",
                                                           selectedImage: "tabbar_home_highlighted")
        let meVC = navigationCotrollerWithViewController(viewController: YSCMeViewController.init(),
                                                         title: "我的", normalImage: "tabbar_profile",
                                                         selectedImage: "tabbar_profile_highlighted")
        viewControllers = [homeVC, meVC]
    }
    
    private func navigationCotrollerWithViewController(viewController: UIViewController, title: String, normalImage: String, selectedImage: String) -> YSCNavigationController {
        
        viewController.title = title
        
        viewController.tabBarItem.image = UIImage.init(named: normalImage)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        
        let normalAttrs: NSMutableDictionary = NSMutableDictionary(dictionary: [NSAttributedStringKey.foregroundColor : UIColor.lightGray])
        let selectedAttrs: NSMutableDictionary = NSMutableDictionary(dictionary: [NSAttributedStringKey.foregroundColor : UIColor.orange])
        
        viewController.tabBarItem.setTitleTextAttributes(normalAttrs as? [NSAttributedStringKey : Any], for: .normal)
        
        viewController.tabBarItem.setTitleTextAttributes(selectedAttrs as? [NSAttributedStringKey : Any], for: .selected)
        
        let navigtionVc = YSCNavigationController.init(rootViewController: viewController)
        return navigtionVc
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
