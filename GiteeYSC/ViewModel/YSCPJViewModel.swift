//
//  YSCPJViewModel.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/25.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit

class YSCPJViewModel: NSObject {

    func loadUserPJ(finished: @escaping (_ isSuccessed: Bool)-> Void) -> Void {
        YSCNetWorkTools.sharedTools.loadUserPJ { (response, error) in
            if error != nil {
                
                print(error!)
                finished(false)
                
                return
            }
            
            print(response!)
            finished(true)
        }
    }
}

extension YSCPJViewModel {
    
    
}
