//
//  School.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 26/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class School: NSObject {

    var startYear : Int
    var endYear : Int
    var univesity : String
    var location : String
    var degree : String
    var discipline : String
        
    init(yearFrom: Int, yearTo: Int, univ: String, location:String, degree:String, discipline: String)
    {
        self.startYear = yearFrom
        self.endYear = yearTo
        self.univesity = univ
        self.location = location
        self.degree = degree
        self.discipline = discipline
    }
}
