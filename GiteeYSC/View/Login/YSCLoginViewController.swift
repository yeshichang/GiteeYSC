//
//  YSCLoginViewController.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/23.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit
import WebKit

class YSCLoginViewController: YSCBaseViewController {
    
    deinit {
        print("释放了YSCLoginViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupNavigationItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        view = webView
        
        let urlRequest = URLRequest(url: YSCNetWorkTools.sharedTools.oauthURL)
        webView.loadRequest(urlRequest)
    }
    
    func setupNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: .plain, target: self, action: #selector(write))
    }
    
    @objc func done() {
        dismiss(animated: true) {
            
        }
    }
    
    @objc func write() {
        let js = "document.getElementById('user_login').value = '15238280098@163.com';" +
        "document.getElementById('user_password').value = 'qq7856120';"
        
        // 让 webView 执行 js
        webView.stringByEvaluatingJavaScript(from: js)
    }
    

    // MARK:    -- lazy --
    private lazy var webView: UIWebView = {
        
        let webView: UIWebView = UIWebView(frame: view.bounds)
        
        webView.delegate = self
        return webView
    } ()

}

extension YSCLoginViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        // 1. 判断访问的主机是否是 www.baidu.com
        guard let url = request.url, url.host == "www.baidu.com" else {
            return true
        }
        
        // 2. 从百度地址的 url 中提取 `code=` 是否存在
        guard let query = url.query, query.hasPrefix("code=") else {
            print("取消授权")
            self.done()
            return false
        }
        
        // 3. 从 query 字符串中提取 `code=` 后面的授权码
        let code = query.substring(from: "code=".endIndex)

        print(query)
        print("授权码是 " + code)
        
        // 4. 加载授权码
        YSCUserAccountViewModel.shared.loadAccessToken(code: code) { (isSuccessed) in
            
            // finished 的完整代码
            if !isSuccessed {
                
                self.done()
                
                return
            }
            
            print("授权成功")
            self.done()
        }
        
        
        return false
    }
}



