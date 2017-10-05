//
//  MainVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 14/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super .viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func isUserAuthenticated() -> Bool
    {
        //Move to Utility
        let defaults = UserDefaults.standard
        let userName = defaults.string(forKey: "email")
        let password = defaults.string(forKey: "password")
        
        if usernameTF.text == userName && passwordTF.text == password {
            return true
        }
        return false
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        if isUserAuthenticated() {
            self.performSegue(withIdentifier: "MainPage", sender: nil)
        }
        else{
            Utility.showAlert(overVC: self, message: "Incorrect Email/Password", completion: nil)
        }
    }
}
