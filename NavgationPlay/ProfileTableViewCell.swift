//
//  ProfileTableViewCell.swift
//  NavgationPlay
//
//  Created by zmc on 15/9/12.
//  Copyright (c) 2015年 zmc. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profile: UIImageView!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
       // println(profile.constraints().description)
        let constraints = profile.constraints
        for constraint in constraints {
            if constraint.firstAttribute == NSLayoutAttribute.Height {
                constraint.constant = (profile.image?.size.height)!
                print("before: \(profile.image?.size.height), \(profile.image?.size.width)")
                print(" after: \(NSLayoutAttribute.Height), \(NSLayoutAttribute.Width)")
            }
        }
    }


}
