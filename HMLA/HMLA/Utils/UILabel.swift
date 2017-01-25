//
//  UILabel.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/25.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    class func label(
        with frame:CGRect,
        backgroundColor: UIColor,
        font: UIFont,
        textAlignment: NSTextAlignment,
        textColor: UIColor) -> UILabel{
            
            let label = UILabel(frame: frame)
            label.backgroundColor = backgroundColor
            label.font = font
            label.textAlignment = textAlignment
            label.textColor = textColor
            return label
    }
    
}