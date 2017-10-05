//
//  MePickerView.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 03/10/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class MePickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerTextField : UITextField!
    var pickerArray : Array<String> = []

    
    init(pickerArr:Array<String>, pickerTF:UITextField)
    {
        super.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:150))
        
        pickerArray = pickerArr
        pickerTextField = pickerTF
        
        self.delegate = self
        self.dataSource = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let title : String = pickerArray[row]
        let attributes: [String:AnyObject] =
            [NSForegroundColorAttributeName : UIColor.black]
        
        let attribString: NSAttributedString = NSAttributedString(string: title, attributes:attributes)
        
        return attribString
    }
    
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text =  pickerArray[row]
    }

}
