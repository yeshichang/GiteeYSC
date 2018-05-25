//
//  YSCPJViewController.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/25.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit

class YSCPJViewController: YSCBaseViewController {

    private lazy var PJViewModel = YSCPJViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "我的项目"
        view.backgroundColor = UIColor.white
        
        PJViewModel.loadUserPJ { (isSuccess) in
            print(isSuccess)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
