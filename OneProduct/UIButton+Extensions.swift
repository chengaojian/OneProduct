//
//  UIButtonExtensions.swift
//  OneProduct
//
//  Created by Mac on 2017/2/4.
//  Copyright © 2017年 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func customUIButton (title: String){
        
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}

