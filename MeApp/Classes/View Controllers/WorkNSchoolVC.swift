//
//  WorkNSchoolVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 26/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class WorkNSchoolVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var schoolTableView: UITableView!
    @IBOutlet weak var workTableView: UITableView!
    
    var schoolArray : Array<School> = []
    var workArray   : Array<Work> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Work & School"
        Utility.addSideMenuOn(vc: self)
        
        schoolArray = getSchoolArray()
        workArray = getWorkArray()
    }
    
    func getSchoolArray() -> Array<School> {
        
        var arr = Array<School>()
        arr.append(School(yearFrom: 2000, yearTo: 2004, univ: "University of California, Los Angeles", location: "Los Angeles, CA 90095", degree: "Bachelors Degree", discipline: "English & Creative Writing"))
        
        arr.append(School(yearFrom: 1996, yearTo: 2000, univ: "John Marshall High", location: "Los Angeles, CA 90095", degree: "Cachelors Degree", discipline: "English & Creative Writing"))
        
        return arr
    }
    
    func getWorkArray() -> Array<Work>{
        var arr = Array<Work>()
        arr.append(Work(yearFrom: 2010, yearTo: 2017, company: "LA Times", location: "LA", designation: "Journalist"))
        arr.append(Work(yearFrom: 2006, yearTo: 2010, company: "LA Downtown News", location: "LA", designation: "Publisher"))
        arr.append(Work(yearFrom: 2005, yearTo: 2006, company: "FreeLance Journalist", location: "LA", designation: "Journal"))
        return arr
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if(tableView == self.schoolTableView){
            return schoolArray.count
        }
        else{
            return workArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == self.schoolTableView)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell") as! SchoolTableViewCell
            
            cell.yearLbl.text = " \(schoolArray[indexPath.row].startYear) - \(schoolArray[indexPath.row].endYear)"
            cell.degreeLbl.text = schoolArray[indexPath.row].degree
            cell.locationLbl.text = schoolArray[indexPath.row].location
            cell.degreeLbl.text = schoolArray[indexPath.row].degree
            cell.disciplineLbl.text = schoolArray[indexPath.row].discipline
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "workCell") as! WorkTableViewCell
            
            cell.yearLbl.text = " \(workArray[indexPath.row].startYear) - \(workArray[indexPath.row].endYear)"
            cell.companyLbl.text = workArray[indexPath.row].company
            cell.locationLbl.text = workArray[indexPath.row].location
            cell.designationLbl.text = workArray[indexPath.row].designation
            
            return cell
        }
    }
    
    
    @IBAction func backAction(_ sender: Any) {
            _ = navigationController?.popViewController(animated: true)
    }
    
}
