//
//  AccomplishmentVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 19/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit
import CVCalendar

class AccomplishmentVC: UIViewController {

    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Accomplishments" 
        Utility.addSideMenuOn(vc: self)
        
        
        // CVCalendarMenuView initialization with frame
//        self.menuView = CVCalendarMenuView(frame: CGRect(x:0, y:0, width:300, height:15))
//        
//        // CVCalendarView initialization with frame
//        self.calendarView = CVCalendarView(frame: CGRect(x:0, y:20, width:300, height:450))
//        
//        // Appearance delegate [Unnecessary]
////        self.calendarView.calendarAppearanceDelegate = self
//        
//        // Animator delegate [Unnecessary]
////        self.calendarView.animatorDelegate = self
//        
//        // Menu delegate [Required]
//        self.menuView.menuViewDelegate = self
//        
//        // Calendar delegate [Required]
//        self.calendarView.calendarDelegate = self

        // Do any additional setup after loading the view.
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        menuView.commitMenuViewUpdate()
//        calendarView.commitCalendarViewUpdate()
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
