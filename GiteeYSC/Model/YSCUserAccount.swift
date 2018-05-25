//
//  YSCUserAccount.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/23.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit

class YSCUserAccount: NSObject, NSCoding {
    

    /// 用于调用access_token，接口获取授权后的access token
    var access_token: String?
    
    /// access_token的生命周期，单位是秒数
    /// 一旦从服务器获得过期的时间，立刻计算准确的日期
    var expires_in: TimeInterval = 0
    
    /// 过期日期
    var expiresDate: NSDate?
    
    /// 刷新token
    var refresh_token: String?
    
    /// token_type
    var token_type: String?
    
    // MARK:  -userInfo
    /// 地址
    var address: [String : AnyObject]?
    /// 头像
    var avatar_url: String?
    /// bio
    var bio: String?
    /// 播客
    var blog: String?
    /// 创建时间
    var created_at: String?
    /// 邮箱
    var email: String?
    /// events_url
    var events_url: String?
    /// followers
    var followers: String?
    /// followers_url
    var followers_url: String?
    /// following
    var following: String?
    /// following_url
    var following_url: String?
    /// gists_url
    var gists_url: String?
    /// html_url
    var html_url: String?
    /// id
    var id: NSInteger?
    /// login
    var login: String?
    /// name
    var name: String?
    /// organizations_url
    var organizations_url: String?
    /// 私有仓库个数
    var owned_private_repos: String?
    /// 仓库个数
    var owned_repos: String?
    /// 电话
    var phone: String?
    /// private_gists
    var private_gists: String?
    /// private_token
    var private_token: String?
    /// public_gists
    var public_gists: String?
    /// 公开仓库个数
    var public_repos: String?
    /// received_events_url
    var received_events_url: String?
    /// repos_url
    var repos_url: String?
    /// site_admin
    var site_admin: String?
    /// stared
    var stared: String?
    /// starred_url
    var starred_url: String?
    /// subscriptions_url
    var subscriptions_url: String?
    /// total_private_repos
    var total_private_repos: String?
    /// total_repos
    var total_repos: String?
    /// type
    var type: String?
    /// unconfirmed_email
    var unconfirmed_email: String?
    /// updated_at
    var updated_at: String?
    /// url
    var url: String?
    /// watched
    var watched: String?
    /// weibo
    var weibo: String?
    
    
    
    init(dict: [String: AnyObject]) {
        super.init()
        
//        self.setValuesForKeys(dict)
        access_token = dict["access_token"] as? String
        expires_in = dict["expires_in"] as! TimeInterval
        expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        refresh_token = dict["refresh_token"] as? String
        token_type = dict["token_type"] as? String
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
    /// 设置用户信息
    func setUserModel(dict: [String : AnyObject]) -> Void {
        address = dict["address"] as? [String : AnyObject]
        avatar_url = dict["avatar_url"] as? String
        bio = dict["bio"] as? String
        blog = dict["blog"] as? String
        email = dict["email"] as? String
        followers = dict["followers"] as? String
        followers_url = dict["followers_url"] as? String
        following = dict["following"] as? String
        following_url = dict["following_url"] as? String
        gists_url = dict["gists_url"] as? String
        html_url = dict["html_url"] as? String
        id = dict["id"] as? NSInteger
        login = dict["login"] as? String
        name = dict["name"] as? String
        organizations_url = dict["organizations_url"] as? String
        owned_private_repos = dict["owned_private_repos"] as? String
        owned_repos = dict["owned_repos"] as? String
        phone = dict["phone"] as? String
        private_gists = dict["private_gists"] as? String
        private_token = dict["private_token"] as? String
        public_gists = dict["public_gists"] as? String
        public_repos = dict["public_repos"] as? String
        received_events_url = dict["received_events_url"] as? String
        repos_url = dict["repos_url"] as? String
        site_admin = dict["site_admin"] as? String
        stared = dict["stared"] as? String
        starred_url = dict["starred_url"] as? String
        subscriptions_url = dict["subscriptions_url"] as? String
        total_private_repos = dict["total_private_repos"] as? String
        total_repos = dict["total_repos"] as? String
        type = dict["type"] as? String
        unconfirmed_email = dict["unconfirmed_email"] as? String
        updated_at = dict["updated_at"] as? String
        url = dict["url"] as? String
        watched = dict["watched"] as? String
        weibo = dict["weibo"] as? String
    }

    
    // MARK: - `键值`归档和解档
    /// 归档 - 在把当前对象保存到磁盘前，将对象编码成二进制数据 － 跟网络的序列化概念很像！
    ///
    /// - parameter aCoder: 编码器
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expiresDate, forKey: "expiresDate")
        aCoder.encode(refresh_token, forKey: "refresh_token")
        aCoder.encode(token_type, forKey: "token_type")
        
        aCoder.encode(address, forKey: "address")
        aCoder.encode(avatar_url, forKey: "avatar_url")
        aCoder.encode(bio, forKey: "bio")
        aCoder.encode(blog, forKey: "blog")
        aCoder.encode(created_at, forKey: "created_at")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(events_url, forKey: "events_url")
        aCoder.encode(followers, forKey: "followers")
        aCoder.encode(followers_url, forKey: "followers_url")
        aCoder.encode(following, forKey: "following")
        aCoder.encode(following_url, forKey: "following_url")
        aCoder.encode(gists_url, forKey: "gists_url")
        aCoder.encode(html_url, forKey: "html_url")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(login, forKey: "login")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(organizations_url, forKey: "organizations_url")
        aCoder.encode(owned_private_repos, forKey: "owned_private_repos")
        aCoder.encode(owned_repos, forKey: "owned_repos")
        aCoder.encode(phone, forKey: "phone")
        aCoder.encode(private_gists, forKey: "private_gists")
        aCoder.encode(private_token, forKey: "private_token")
        aCoder.encode(public_gists, forKey: "public_gists")
        aCoder.encode(public_repos, forKey: "public_repos")
        aCoder.encode(received_events_url, forKey: "received_events_url")
        aCoder.encode(repos_url, forKey: "repos_url")
        aCoder.encode(site_admin, forKey: "site_admin")
        aCoder.encode(stared, forKey: "stared")
        aCoder.encode(starred_url, forKey: "starred_url")
        aCoder.encode(subscriptions_url, forKey: "subscriptions_url")
        aCoder.encode(total_private_repos, forKey: "total_private_repos")
        aCoder.encode(total_repos, forKey: "total_repos")
        aCoder.encode(type, forKey: "type")
        aCoder.encode(unconfirmed_email, forKey: "unconfirmed_email")
        aCoder.encode(updated_at, forKey: "updated_at")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(watched, forKey: "watched")
        aCoder.encode(weibo, forKey: "weibo")
    }
    
    /// 解档 - 从磁盘加载二进制文件，转换成对象时调用 － 跟网络的反序列化很像
    ///
    /// - parameter aDecoder: 解码器
    ///
    /// - returns: 当前对象
    /// `required` - 没有继承性，所有的对象只能解档出当前的类对象
    required init?(coder aDecoder: NSCoder) {
        
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expiresDate = aDecoder.decodeObject(forKey: "expiresDate") as? NSDate
        refresh_token = aDecoder.decodeObject(forKey: "refresh_token") as? String
        token_type = aDecoder.decodeObject(forKey: "token_type") as? String
        
        address = aDecoder.decodeObject(forKey: "address") as? [String : AnyObject]
        avatar_url = aDecoder.decodeObject(forKey: "avatar_url") as? String
        bio = aDecoder.decodeObject(forKey: "bio") as? String
        blog = aDecoder.decodeObject(forKey: "blog") as? String
        created_at = aDecoder.decodeObject(forKey: "created_at") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        events_url = aDecoder.decodeObject(forKey: "events_url") as? String
        followers = aDecoder.decodeObject(forKey: "followers") as? String
        followers_url = aDecoder.decodeObject(forKey: "followers_url") as? String
        following = aDecoder.decodeObject(forKey: "following") as? String
        following_url = aDecoder.decodeObject(forKey: "following_url") as? String
        gists_url = aDecoder.decodeObject(forKey: "gists_url") as? String
        html_url = aDecoder.decodeObject(forKey: "html_url") as? String
        id = aDecoder.decodeObject(forKey: "id") as? NSInteger
        login = aDecoder.decodeObject(forKey: "login") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        organizations_url = aDecoder.decodeObject(forKey: "organizations_url") as? String
        owned_private_repos = aDecoder.decodeObject(forKey: "owned_private_repos") as? String
        owned_repos = aDecoder.decodeObject(forKey: "owned_repos") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        private_gists = aDecoder.decodeObject(forKey: "private_gists") as? String
        private_token = aDecoder.decodeObject(forKey: "private_token") as? String
        public_gists = aDecoder.decodeObject(forKey: "public_gists") as? String
        public_repos = aDecoder.decodeObject(forKey: "public_repos") as? String
        received_events_url = aDecoder.decodeObject(forKey: "received_events_url") as? String
        repos_url = aDecoder.decodeObject(forKey: "repos_url") as? String
        site_admin = aDecoder.decodeObject(forKey: "site_admin") as? String
        stared = aDecoder.decodeObject(forKey: "stared") as? String
        starred_url = aDecoder.decodeObject(forKey: "starred_url") as? String
        subscriptions_url = aDecoder.decodeObject(forKey: "subscriptions_url") as? String
        total_private_repos = aDecoder.decodeObject(forKey: "total_private_repos") as? String
        total_repos = aDecoder.decodeObject(forKey: "total_repos") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        unconfirmed_email = aDecoder.decodeObject(forKey: "unconfirmed_email") as? String
        updated_at = aDecoder.decodeObject(forKey: "updated_at") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        watched = aDecoder.decodeObject(forKey: "watched") as? String
        weibo = aDecoder.decodeObject(forKey: "weibo") as? String
    }
    
}


