//
//  PersonInfoViewController.swift
//  NavgationPlay
//
//  Created by zmc on 15/9/11.
//  Copyright (c) 2015年 zmc. All rights reserved.
//

import UIKit

class PersonInfoViewController: UIViewController,UITableViewDataSource, UITableViewDelegate
{
    
    // MARK: - Public API
    
    // fake data
    var dataArray1: NSMutableArray = ["icon-touxiang-1","张三三","三三","sdfhth@163.com","icon-erweima"]
    var dataArray2: NSMutableArray = ["女","浙江 杭州"]
    var dataArray3: NSMutableArray = ["已认证","135****4567"]
    var titlArray1: NSMutableArray = ["头像","真实姓名","昵称","账户名","我的二维码"]
    var titlArray2: NSMutableArray = ["性别","居住地"]
    var titlArray3: NSMutableArray = ["实名认证","绑定手机"]
    var titlArray4: NSMutableArray = ["修改登录密码"]
    

    let context = CIContext(options:[kCIContextUseSoftwareRenderer : true])
    let defaultBlackColor = UIColor.init(red: 60/255.0, green: 63/255.0, blue: 73/255.0, alpha: 0)

    
    // MARK: - Outlet
    @IBOutlet weak var userInfoTable: UITableView!

    
    // MARK: - Appearence of NavigationController
    func setAppearenceNC() {
        self.navigationItem.title = "个人资料"
        self.navigationController?.navigationBar.titleTextAttributes = NSDictionary(dictionary: NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)) as? [String : AnyObject]
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = defaultBlackColor
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearenceNC()
        
        /*使用Self Sizing Cells*/
        userInfoTable.estimatedRowHeight = 90
        userInfoTable.rowHeight = UITableViewAutomaticDimension
    }
    
    
    
    // MARK: - UITabelViewDelegate
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    /*分组标题行高*/
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch (section) {
        case 0:
            return 5
        default:
            return 0
        }
    }
    
    /*返回每组头标题*/
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return ""
        case 1:
            return ""
        case 2:
            return ""
        default:
            break
        }
        return nil
    }
    
    // cell分割线左边缺失解决
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector("setSeparatorInset:") {
            cell.separatorInset = UIEdgeInsetsZero
            userInfoTable.separatorInset = UIEdgeInsetsZero
        }
        
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
            userInfoTable.layoutMargins = UIEdgeInsetsZero
        }
    }
    
    /*section数*/
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    /*每个section的row数*/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return titlArray1.count
        case 1:
            return titlArray2.count
        case 2:
            return titlArray3.count
        case 3:
            return titlArray4.count
        default:
            return 0
        }
    }
    


    /*绘制cell*/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        var reuseIdentifier: String?
        
        // 确认cell类型
        switch(indexPath.section) {
        case 0:
            if indexPath.row == 0 || indexPath.row == 4 {
                reuseIdentifier = "ProfileTableViewCell"
            } else if indexPath.row == 1 || indexPath.row == 3 {
                reuseIdentifier = "TextOnlyTableViewCell"
            } else {
                reuseIdentifier = "TextTableViewCell"
            }
        case 1:
            if indexPath.row == 0 {
                reuseIdentifier = "TextOnlyTableViewCell"
            } else {
                reuseIdentifier = "TextTableViewCell"
            }
        case 2:
            reuseIdentifier = "TextTableViewCell"
        case 3:
            reuseIdentifier = "TitleOnlyCell"
        default:
            break
        }

        // 创建、填充cell
        switch(reuseIdentifier!) {
        case "ProfileTableViewCell":
            var cell1 = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!, forIndexPath: indexPath) as? ProfileTableViewCell
            if cell1 == nil {
                cell1 = ProfileTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
            }
            switch(indexPath.section) {
            case 0:
                cell1?.itemLabel.text = titlArray1[indexPath.row] as? String
                if let imageStr:String = dataArray1[indexPath.row] as? String {
                    cell1?.profile.image = UIImage(named: imageStr)
                }
            case 1:
                cell1?.itemLabel.text = titlArray2[indexPath.row] as? String
            case 2:
                cell1?.itemLabel.text = titlArray3[indexPath.row] as? String
            default:
                break
            }
            return cell1!
        case "TextOnlyTableViewCell":
            var cell2 = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!, forIndexPath: indexPath) as? TextOnlyTableViewCell
            if cell2 == nil {
                cell2 = TextOnlyTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
            }
            switch(indexPath.section) {
            case 0:
                cell2?.itemLabel?.text = titlArray1[indexPath.row] as? String
                cell2?.rightInfoLabel?.text = dataArray1[indexPath.row] as? String
            case 1:
                cell2?.itemLabel?.text = titlArray2[indexPath.row] as? String
                cell2?.rightInfoLabel?.text = dataArray2[indexPath.row] as? String
            case 2:
                cell2?.itemLabel?.text = titlArray3[indexPath.row] as? String
                cell2?.rightInfoLabel?.text = dataArray3[indexPath.row] as? String
            default:
                break
            }
            return cell2!
        case "TextTableViewCell":
            var cell3 = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!, forIndexPath: indexPath) as? TextTableViewCell
            if cell3 == nil {
                cell3 = TextTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
            }
            switch(indexPath.section) {
            case 0:
                cell3?.itemLabel?.text = titlArray1[indexPath.row] as? String
                cell3?.rightInfoLabel?.text = dataArray1[indexPath.row] as? String
            case 1:
                cell3?.itemLabel?.text = titlArray2[indexPath.row] as? String
                cell3?.rightInfoLabel?.text = dataArray2[indexPath.row] as? String
            case 2:
                cell3?.itemLabel?.text = titlArray3[indexPath.row] as? String
                cell3?.rightInfoLabel?.text = dataArray3[indexPath.row] as? String
            default:
                break
            }
            return cell3!
        default:
            var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!, forIndexPath: indexPath) as? TitleOnlyCell
            if cell == nil {
                cell = TitleOnlyCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
            }
            if indexPath.section == 3 {
                cell?.itemLabel?.text = titlArray4[indexPath.row] as? String
            }
            return cell!
        }

    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
            case 0:
                break
            case 2:
                break
            case 4:
                break
            default:
                break
            }
        case 1:
            switch (indexPath.row) {
            case 1:
                break
            default:
                break
            }
        case 2:
            switch (indexPath.row) {
            case 0:break
            case 1:break
            default:
                break
            }
        case 3:
            break
        default:
            break
        }
    }
    
}




















