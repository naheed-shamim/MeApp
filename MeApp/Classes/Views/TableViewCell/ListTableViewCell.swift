//
//  ListTableViewCell.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 18/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var txtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
