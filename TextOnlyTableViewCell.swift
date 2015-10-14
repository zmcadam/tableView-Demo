//
//  TextOnlyTableViewCell.swift
//  NavgationPlay
//
//  Created by zmc on 15/9/15.
//  Copyright (c) 2015年 zmc. All rights reserved.
//

import UIKit

class TextOnlyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var rightInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rightInfoLabel.textColor = UIColor.lightGrayColor()
    }

}
