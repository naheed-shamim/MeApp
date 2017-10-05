//
//  UnderlinedTextField.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 13/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class UnderlinedTextField: UITextField, UITextFieldDelegate  {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        createBorder()
    }
//    required override init(frame: CGRect) {
//        super.init(frame: frame)
//        delegate = self
//        createBorder()
//    }
    
    func createBorder()
    {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x:-10, y:self.frame.size.height - borderWidth, width:self.frame.size.width, height:self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
//        self.layer.masksToBounds = true
    }
}
