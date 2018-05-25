//
//  YSCMeViewController.swift
//  GiteeYSC
//
//  Created by 叶世昌 on 2018/5/22.
//  Copyright © 2018年 叶世昌. All rights reserved.
//

import UIKit

class YSCMeViewController: YSCBaseViewController {
    
    // 第二组
    let image2 = UIImage(named: "opinion_my")
    let text2 = "我的项目"
    
    /// 第三组
    let imageArr3 = [UIImage(named: "about-_my"), UIImage(named: "contact_my"), UIImage(named: "icon_change"), UIImage(named: "invite_my")]
    let textArr3 = ["我的动态", "我的followers", "我的创建时间", "我的最后更新时间"]
    
    /// 第四组
    let image4 = UIImage(named: "settings_my")
    let text4 = "设置"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view = tableView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !YSCUserAccountViewModel.shared.userLogon {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginAction(_:)))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func loginAction(_ barButtonItem: UIBarButtonItem) {
        
        let loginVC = YSCNavigationController(rootViewController: YSCLoginViewController.init())
        
        present(loginVC, animated: true) {
            
        }
        
    }

    // MARK: - lazy
    private lazy var tableView: UITableView = {
        let table = UITableView.init(frame: view.bounds, style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()

}

extension YSCMeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0, 1, 3:
            return 1
        case 2:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let avatarCell = YSCMeAvatarTableViewCell.cell(tableView: tableView)
        
        let cell = YSCMeTableViewCell.cell(tableView: tableView)
        
        switch indexPath.section {
        case 0:
            if YSCUserAccountViewModel.shared.userLogon {
                avatarCell.viewModel = YSCUserAccountViewModel.shared
            }
            return avatarCell
        case 1:
            cell.setData(image: image2!, text: text2)
            return cell
        case 2:
            cell.setData(image: imageArr3[indexPath.row]!, text: textArr3[indexPath.row])
            return cell
        default:
            cell.setData(image: image4!, text: text4)
            return cell
        }

    }
}

extension YSCMeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            break
        case 1:
            let PJVC = YSCPJViewController.init()
            navigationController?.pushViewController(PJVC, animated: true)
            
            break
            
        default: break
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 80
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
}
