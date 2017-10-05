//
//  ParentViewController.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 25/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SettingsVC: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var profileImgView: UIImageView!
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    func loadUI()
    {
        self.title = "Settings"
        if let img: UIImage = Utility.getImageFromDocDirectory(imgName: Constants.kProfilePic) {
            self.profileImgView.image = img
        }
        
        UIUtils.makeCircular(element: self.profileImgView)
        changeBarColor()
        Utility.addSideMenuOn(vc: self)
    }
    
    // change selected bar color
    func changeBarColor()
    {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .purple
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = self?.purpleInspireColor
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child_1 = UIStoryboard(name: "HomeInterface", bundle: nil).instantiateViewController(withIdentifier: "general")
        let child_2 = UIStoryboard(name: "HomeInterface", bundle: nil).instantiateViewController(withIdentifier: "Alert")
        
        return [child_1, child_2]
    }    
}
