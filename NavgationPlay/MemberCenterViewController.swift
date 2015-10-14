//
//  MemberCenterViewController.swift
//  NavgationPlay
//
//  Created by zmc on 15/9/1.
//  Copyright (c) 2015年 zmc. All rights reserved.
//

import UIKit


class MemberCenterViewController: UIViewController {

    
    
    var rpersonImageView:CGFloat?
    
    @IBOutlet weak var personView: UIView!
 
    @IBOutlet weak var personImageView: UIImageView! 
    
    @IBOutlet weak var setButton: UIButton!
    
    @IBAction func setButton(sender: UIButton) {
      
    }
    
    // MARK: - 获得设备尺寸
    func getDeviceSize() -> Int {
        let deviceY = UIScreen.mainScreen().bounds.height
        switch (deviceY) {
        case 480:
            return 4
        case 568:
            return 5
        case 667:
            return 6
        case 736:
            return 7
        default:
            break
        }
        return 0
    }

    
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        personView.layer.contents = UIImage(named: "bg-vip")?.CGImage
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // 隐藏状态栏
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        // 用户头像设置圆角
        personImageView.layer.shouldRasterize = true
        personImageView.layer.rasterizationScale = UIScreen.mainScreen().scale
        personImageView.layer.contents = UIImage(named: "icon-touxiang-1")?.CGImage
        personImageView.layer.cornerRadius = personImageView.bounds.height/2
        personImageView.layer.masksToBounds = true
        personImageView.layer.borderWidth = 1.5
        personImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        setButton.layer.cornerRadius = setButton.bounds.width/5
        personImageView.layer.masksToBounds = true
    }
    
}

