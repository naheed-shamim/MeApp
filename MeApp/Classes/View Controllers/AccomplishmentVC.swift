//
//  AccomplishmentVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 19/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit
//import CVCalendar

class AccomplishmentVC: UIViewController {
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Accomplishments" 
        Utility.addSideMenuOn(vc: self)
        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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
