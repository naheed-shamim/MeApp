//
//  UIUtils.swift
//  MeApp
//
//  Created by Naheed Shamim on 04/10/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import Foundation

class UIUtils{
    
    class func makeCircular(element: UIView)
    {
        let height = element.frame.height/2
        let width = element.frame.width/2
        
        let radius = (width > height) ? width : height
        
        element.layer.cornerRadius = radius
        element.clipsToBounds = true
        
    }
}
