//
//  PassportVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 20/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class PassportVC: UIViewController {

    @IBOutlet weak var docImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Passport"
        getImageDocs()
//        Utility.addSideMenuOn(vc: self)
    }
    
    func getImageDocs()
    {
        if let img:UIImage = Utility.getImageFromDocDirectory(imgName: "passport")
        {
            self.docImageView.image = img
        }
    }    

    @IBAction func uploadDocs(_ sender: Any)
    {
        // Load the Custom ImagePicker
        let imgPicker = ImagePicker()
        
        imgPicker.pickImage(vc: self)
        
        imgPicker.getImage { (img) in
            
            self.docImageView.image = img
            Utility.saveToDocDirectory(image: self.docImageView.image!, imgName: "passport")
        }
    }
}
