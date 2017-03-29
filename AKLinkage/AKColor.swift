//
//  AKColor.swift
//  AKLinkage
//
//  Created by 李亚坤 on 2017/3/29.
//  Copyright © 2017年 Kuture. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init ( _ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat){
        
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
    
    
}
