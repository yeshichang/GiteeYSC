//
//  YSCMeTableViewCell.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/25.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

let MeAvatarTableViewCell = "MeAvatarTableViewCell"
let MeTableViewCell = "MeTableViewCell"

class YSCMeAvatarTableViewCell: UITableViewCell {
 
    var viewModel: YSCUserAccountViewModel?  {
        didSet {
            
            let avatarURL: URL? = URL(string: (viewModel?.account?.avatar_url)!)
            avatarImageView.sd_setImage(with: avatarURL, completed: nil)

            nameLabel.text = viewModel?.account?.name

            emailLabel.text = "账号" + (viewModel?.account?.email)!
        }
    }
    
    // MARK: - override
    private override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - public
    class func cell(tableView: UITableView)-> YSCMeAvatarTableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: MeAvatarTableViewCell)
        if cell == nil {
            cell = YSCMeAvatarTableViewCell.init(style: .default, reuseIdentifier: MeAvatarTableViewCell)
            cell?.accessoryType = .disclosureIndicator
        }
        return cell as! YSCMeAvatarTableViewCell
    }
    
    // MARK: - private
    /// 设置视图
    private func setupUI() -> Void {
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
    }
    
    /// 设置约束
    private func setupLayout() -> Void {
        avatarImageView.snp.makeConstraints({ (make) in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(contentView.frame.size.height - 20)
        })
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp.right).offset(10)
            make.top.equalTo(avatarImageView.snp.top).offset(10)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp.right).offset(10)
            make.bottom.equalTo(avatarImageView.snp.bottom).offset(-10)
        }
    }
    
    // MARK: - lazy
    /// 头像
    lazy var avatarImageView: UIImageView = {
        let imgV = UIImageView.init()
        imgV.layer.cornerRadius = 5;
        imgV.layer.masksToBounds = true
        return imgV
    }()
    
    /// 名字
    lazy var nameLabel: UILabel = {
        let name = UILabel.init()
        name.font = UIFont.systemFont(ofSize: 15)
        return name
    }()
    
    /// 账号
    lazy var emailLabel: UILabel = {
        let email = UILabel.init()
        email.font = UIFont.systemFont(ofSize: 12)
        email.textColor = UIColor.darkGray
        return email
    }()
}

class YSCMeTableViewCell: UITableViewCell {
    
    // MARK: - override
    private override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - public
    class func cell(tableView: UITableView)-> YSCMeTableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: MeTableViewCell)
        if cell == nil {
            cell = YSCMeTableViewCell.init(style: .default, reuseIdentifier: MeTableViewCell)
            cell?.accessoryType = .disclosureIndicator
        }
        return cell as! YSCMeTableViewCell
    }
}

// MARK: - 设置
extension YSCMeTableViewCell {
    
    /// 设置数据
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - text: 文字
    public func setData(image: UIImage, text: String) -> Void {
        imageView?.image = image
        textLabel?.font = UIFont.systemFont(ofSize: 13)
        textLabel?.textColor = UIColor.darkGray
        textLabel?.text = text
    }
}

