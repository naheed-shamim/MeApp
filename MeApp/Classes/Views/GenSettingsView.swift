//
//  GenSettingsView.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 25/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class GenSettingsView: UIView {
    
    @IBOutlet var contentView: UIView!

    @IBOutlet weak var nameTF: UnderlinedTextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        commonInit()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private func commonInit()
    {
        Bundle.main.loadNibNamed("GenSettings", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }

}
