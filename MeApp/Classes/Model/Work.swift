//
//  Work.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 26/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class Work: NSObject {
    
    var startYear : Int
    var endYear : Int
    var company : String
    var location : String
    var designation : String
    
    init(yearFrom: Int, yearTo: Int, company: String, location:String, designation:String)
    {
        self.startYear = yearFrom
        self.endYear = yearTo
        self.company = company
        self.location = location
        self.designation = designation
    }
}
