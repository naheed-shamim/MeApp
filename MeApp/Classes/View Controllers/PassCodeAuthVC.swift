//
//  PassCodeAuthVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 20/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class PassCodeAuthVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var keyboardToolbar: UIToolbar!
    @IBOutlet weak var passcodeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.addSideMenuOn(vc: self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        passcodeTF.inputAccessoryView = keyboardToolbar
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        
        var msg: String = "Wrong Passcode! Try Again"
        if(self.passcodeTF.text == "1234")
        {
            msg = "Success"
            dismissKeyboard()
        }
        Utility.showAlert(overVC:self, message: msg, completion: nil)
        
    }
    
    @IBAction func dismissKeyboard()
    {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
