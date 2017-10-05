//
//  SettingsGenVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 25/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SettingsGenVC: UIViewController, IndicatorInfoProvider , UITextFieldDelegate{
    
//    @IBOutlet weak var generalView: GenSettingsView!
    
    @IBOutlet weak var nameTF: UnderlinedTextField!
    @IBOutlet weak var emailTF: UnderlinedTextField!
    @IBOutlet weak var passwordTF: UnderlinedTextField!
    @IBOutlet weak var birthdateTF: UnderlinedTextField!
    @IBOutlet weak var genderTF: UnderlinedTextField!   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    func loadUI()
    {
        let dict = Utility.getUserDefaults()
        
        if let name = dict[Constants.kNameKey] as? String {
            nameTF.text = name
        }
        
        if let password = dict[Constants.kPassword] as? String {
            passwordTF.text = password
        }
        
        if let email = dict[Constants.kEmail] as? String {
            emailTF.text = email
        }
        
        if let birthdate = dict[Constants.kBirthdate] as? String {
            birthdateTF.text = birthdate
        }
        
        if let gender = dict[Constants.kGender] as? String {
            genderTF.text = gender
        }
    }
    
    @IBAction func dismissKeyboard()
    {
        self.view.endEditing(true)
    }
    
    
    //MARK: - TextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.birthdateTF)
        {
            Utility.showDatePicker(dateTextField: textField)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == self.genderTF){
        return false
        }
        return true
    }
    
    //MARK: - Functions for XLPagerStrip
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "GENERAL")
    }
}
