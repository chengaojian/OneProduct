//
//  TimeLineCell.swift
//  OneProduct
//
//  Created by Mac on 2017/2/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class TimeLineCell: UITableViewCell {
    
    let titleLab = UILabel()
    let desLab = UILabel()
    let lineLab = UILabel()
    let imgView = UIImageView()
    
    open var timeLinePoint = TimeLinePoint() {
    
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    open var timeLine = TimeLine()
    
}
