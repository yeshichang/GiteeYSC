//
//  YSCUserAccountViewModel.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/23.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit

class YSCUserAccountViewModel: NSObject {

    static let shared = YSCUserAccountViewModel()
    
    /// 用户模型
    var account: YSCUserAccount?
    
    /// 返回有效token
    var accessToken: String? {
        // 如果 token 没有过期，返回 account.中的 token 属性
        if !isExpired {
            return account?.access_token
        }
        return nil
    }
    
    /// 用户登录标记
    var userLogon: Bool {
        
        // 1. 如果 token 有值，说明登录成功
        // 2. 如果没有过期，说明登录有效
        return account?.access_token != nil && !isExpired
    }
    
    
    /// 归档保存的路径 - 计算型属性(类似于有返回值的函数，可以让调用的时候，语义会更清晰)
    /// 如果在 OC 中，可以通过只读属性／函数的方式实现
    private var accountPath: String {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        
        return (path as NSString).appendingPathComponent("account.plist")
    }
    
    
    /// 判断账户是否过期
    private var isExpired: Bool {
        
        // 判断用户账户过期日期与当前系统日期`进行比较`
        // 自己改写日期，测试逻辑是否正确，创建日期的时候，如果给定 负数，返回比当前时间早的日期
        // account?.expiresDate = NSDate(timeIntervalSinceNow: -3600)
        
        // 如果 account 为 nil，不会调用后面的属性，后面的比较也不会继续...
        if account?.expiresDate?.compare(Date()) == ComparisonResult.orderedDescending {
            // 代码执行到此，一定进行过比较！
            return false
        }
        
        // 如果过期返回 true
        return true
    }
    
    // MARK: - 构造函数
    /// 构造函数 － 私有化，会要求外部只能通过单例常量访问，而不能 () 实例化
    private override init() {
        super.init()
        // 从沙盒解档数据，恢复当前数据 - 磁盘读写的速度最慢，不如内存读写效率高！
        account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? YSCUserAccount
        
        // 判断token是否过期
        if isExpired {
            print("已经过期")
            
            // 如果过期，清空解档的数据
            account = nil
        }
    }
}

extension YSCUserAccountViewModel {
    
    
    /// 刷新token
    ///
    /// - Parameters:
    ///   - refresh_token: refresh_token
    ///   - finished: 完成回调
    func refreshAccessToken(refresh_token: String, finished: @escaping (_ isSuccessed: Bool)->()) {
        YSCNetWorkTools.sharedTools.refreshAccess_token(refresh_token: refresh_token) { (result, error) in
            // 1> 判断错误
            if error != nil {
                print("出错了"+(error?.localizedDescription)!)
                
                // 失败的回调
                finished(false)
                return
            }
            
//            self.loadUserInfo(result: result as! [String : AnyObject], finished: finished)
        }
    }
    
    /// 加载token
    ///
    /// - Parameters:
    ///   - code: code
    ///   - finished: 完成回调
    func loadAccessToken(code: String, finished: @escaping (_ isSuccessed: Bool)->()) {
        
        YSCNetWorkTools.sharedTools.loadAccess_token(code: code) { (result, error) in
            // 1> 判断错误
            if error != nil {
                print("出错了"+(error?.localizedDescription)!)
                
                // 失败的回调
                finished(false)
                return
            }
            

            self.loadUserInfo(result: result as! [String : AnyObject], finished: finished)
        }
    }
    
    /// 加载用户信息
    private func loadUserInfo(result: [String : AnyObject], finished: @escaping (_ isSuccessed: Bool)-> Void) {
        
        // 2> 输出结果 － 在 Swift 中任何 AnyObject 在使用前，必须转换类型 -> as ?/! 类型
        // 创建账户对象 - 保存在 self.account 属性中
        self.account = YSCUserAccount.init(dict: result )
        
        YSCNetWorkTools.sharedTools.loadUserInfo { (response, error) in
            if error != nil  {
                
                print(error?.localizedDescription as Any)
                finished(false)
                return
            }
            
            // 提示：如果使用 if let / guard let 统统使用 `?`
            // 作了两个判断
            // 1. result 一定有内容
            // 2. 一定是字典
            guard (response as? [String: AnyObject]) != nil else {
                print("格式错误")
                
                finished(false)
                return
            }
            
            print(response!)
            
            self.account?.setUserModel(dict: response as! [String : AnyObject])
            
            // 保存对象 － 会调用对象的 encodeWithCoder 方法
            NSKeyedArchiver.archiveRootObject(self.account!, toFile: self.accountPath)
            
            // 需要完成回调!!!
            finished(true)
        }
    }
    
}
