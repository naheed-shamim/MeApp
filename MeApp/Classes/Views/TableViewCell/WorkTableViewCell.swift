//
//  WorkTableViewCell.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 27/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class WorkTableViewCell: UITableViewCell {

    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var designationLbl: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
