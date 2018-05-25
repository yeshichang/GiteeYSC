//
//  YSCNetWorkToos.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/23.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit
import AFNetworking

class YSCNetWorkTools: NSObject {
    
    enum YSCNetWorkMethod {
        case GET
        case POST
    }
    
    // MARK: - 应用程序信息
    private let baseURL = "https://gitee.com"
    
    private let client_id = "62d4395fc8872025e57b6f5c1fbc499d1e210bb4375fc0b0f897191c335b2ce1"
    private let client_secret = "6579e7536bf1285f2803949080712875f74d5a5bfa080f25051d0b99859e6595"
    private let redirect_uri = "http://www.baidu.com"

    /// 单例
    static let sharedTools = YSCNetWorkTools()
}

// MARK: - 用户 项目
extension YSCNetWorkTools {
    
    func loadUserPJ(callBack: @escaping (_ result : AnyObject?, _ error : Error?)-> Void) -> Void {
        guard let token = YSCUserAccountViewModel.shared.accessToken else {
            print("token失效")
            return
        }
        
        let username = YSCUserAccountViewModel.shared.account?.login
        
        // 创建参数字典
        let params = ["access_token" : token,
                      "username" : username!,
                      "type" : "all",
                      "sort" : "full_name",
                      "direction" : "asc",
                      "page" : 1,
                      "per_page" : 20] as [String : Any]
        
        let URLString = "/api/v5/users/\(username!)/repos"
        
        request(method: .GET, URLString: URLString, parameters: params as [String : AnyObject], finished: callBack)
    }
}

// MARK: - 用户 资料
extension YSCNetWorkTools {
    
    func loadUserInfo(callBack: @escaping (_ result : AnyObject?, _ error : Error?)-> Void) -> Void {
        
        guard let token = YSCUserAccountViewModel.shared.accessToken else {
            print("token失效")
            return
        }
        //  创建参数字典
        let params = ["access_token" : token]

        request(method: .GET, URLString: "/api/v5/user", parameters: params as [String : AnyObject], finished: callBack)
    }
}

// MARK: - OAuth 相关方法
extension YSCNetWorkTools {
    
    var oauthURL: URL {
        let str: String = "https://gitee.com/oauth/authorize?"
        let queryItem1 = URLQueryItem(name: "client_id", value: client_id)
        let queryItem2 = URLQueryItem(name: "redirect_uri", value: redirect_uri)
        let queryItem3 = URLQueryItem(name: "response_type", value: "code")
        var urlCom = URLComponents(string: str)
        urlCom?.queryItems = [queryItem1, queryItem2, queryItem3]
        return (urlCom?.url)!
    }
    
    // 加载access_token
    func loadAccess_token(code: String, callBack: @escaping (_ result : AnyObject?, _ error : Error?)-> Void) {
        
        // 创建参数字典
        let parameters = ["grant_type" : "authorization_code",
                         "code" : code,
                         "client_id" : client_id,
                         "redirect_uri" : redirect_uri,
                         "client_secret" : client_secret]

        request(method: .POST, URLString: "oauth/token?", parameters: parameters as [String : AnyObject], finished: callBack)
        
    }
    
    // 刷新access_token
    func refreshAccess_token(refresh_token: String,  callBack: @escaping (_ result : AnyObject?, _ error : Error?)-> Void) {
        
        // 创建参数字典
        let parmameters = ["grant_type" : "refresh_token",
                           "refresh_token" : refresh_token]
        
        request(method: .POST, URLString: "oauth/token?", parameters: parmameters as [String : AnyObject], finished: callBack)
    }
}

// MARK: - 封装 afn 网络方法
extension YSCNetWorkTools {
   
    
    /// 网络请求
    ///
    /// - Parameters:
    ///   - method: post  get
    ///   - URLString: url
    ///   - parameters: parameters
    ///   - finished: 完成回调
    private func request(method: YSCNetWorkMethod, URLString: String, parameters: [String: AnyObject]?, finished: @escaping (_ result : AnyObject?, _ error : Error?)-> Void) {
        // 显示网络指示菊花
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let manager = AFHTTPSessionManager.init(baseURL: URL(string: baseURL))
        
        // 成功回调
        let successCallBack = {(task :URLSessionDataTask, result : Any) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            finished(result as AnyObject?, nil)
        }
        
        // 失败回调
        let errorCallBack = {(task : URLSessionDataTask?, error :Error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            finished(nil, error)
        }
        
        if method == .GET {
            manager.get(URLString, parameters: parameters, progress: nil, success: successCallBack, failure: errorCallBack)
        } else if method == .POST {
            manager.post(URLString, parameters: parameters, progress: nil, success: successCallBack, failure: errorCallBack)
        }
    }
}
