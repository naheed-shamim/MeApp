//
//  SchoolTableViewCell.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 26/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var univLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!
    @IBOutlet weak var disciplineLbl: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
