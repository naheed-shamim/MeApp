//
//  RegistrationVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 13/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController, UITextFieldDelegate {
    
    static let kName:String = "kName"
    
    @IBOutlet weak var nameTF: UnderlinedTextField!
    @IBOutlet weak var emailTF: UnderlinedTextField!
    @IBOutlet weak var passwordTF: UnderlinedTextField!
    @IBOutlet weak var birthdayTF: UnderlinedTextField!
    @IBOutlet weak var genderTF: UnderlinedTextField!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var mScrollView: UIScrollView!
    
    var isImageSelected : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Account"
//        setNavBarTransparent()
        loadUI()
    }
    
    deinit {
        KeyboardManager.shared.removeNotification()
    }

    func loadUI()
    {
        KeyboardManager.shared.addNotification(onScrollView: mScrollView)
//        let kbNotification = KeyboardManager(viewController:self)
//        kbNotification.addKeyboardNotification()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Private Methods
    func setNavBarTransparent()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func saveUserData()
    {
        // save to UserDefaults
        let defaults = UserDefaults.standard
        defaults.set(nameTF.text, forKey: Constants.kNameKey)
        defaults.set(emailTF.text, forKey: Constants.kEmail)
        defaults.set(passwordTF.text, forKey: Constants.kPassword)
        defaults.set(birthdayTF.text, forKey: Constants.kBirthdate)
        defaults.set(genderTF.text, forKey: Constants.kGender)
        
        if isImageSelected{
            Utility.saveToDocDirectory(image: self.profileImgView.image!, imgName: Constants.kProfilePic)
        }
    }
    
    func isFormIncomplete() -> Bool
    {
        if (nameTF.text?.isEmpty)! || (emailTF.text?.isEmpty)! || (passwordTF.text?.isEmpty)! || (birthdayTF.text?.isEmpty)! || (genderTF.text?.isEmpty)! {
            return true
        }
        return false
    }
    
    //MARK: - IBActions
    @IBAction func doneBtnAction(_ sender: Any) {
        
        if !isFormIncomplete()
        {
            saveUserData()
            Utility.showDismissAlert(overVC: self, message: "Saved")
        }
        else
        {
            Utility.showAlert(overVC: self, message: "Form is incomplete!!", completion: nil)
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
 
        // return to  tha Login Page
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissKeyboard()
    {
        self.view.endEditing(true)
    }
    
    @IBAction func pickImage(_ sender: UITapGestureRecognizer?)
    {
        // Load the Custom ImagePicker
        let imgPicker = ImagePicker()
        
        imgPicker.pickImage(vc: self)
        
        imgPicker.getImage { (img) in
            self.isImageSelected = true
            self.profileImgView.image = img
        }
    }
    
    
    //MARK: - TextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let pickerArr: Array<String> = ["Male","Female"]
        
        if(textField == birthdayTF) {
            Utility.showDatePicker(dateTextField: textField)
        }
        else if (textField == genderTF)
        {
            textField.inputView = MePickerView(pickerArr: pickerArr, pickerTF: textField)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == self.genderTF) || (textField == self.birthdayTF){
            return false
        }
        return true
    }
}
