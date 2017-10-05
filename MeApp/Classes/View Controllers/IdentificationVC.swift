//
//  IdentificationVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 18/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

private enum Identification : Int {
    case currentPhoto = 0
    case birthCertificate
    case driversLicense
    case ssn
    case passport
    case other
}

class IdentificationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listArray = Array<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.addSideMenuOn(vc: self)
        listArray = Constants.getIdentificationMenuArray()
//        loadListItems()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    //MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell!
        cell?.txtLabel.text = listArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let row = Identification(rawValue: indexPath.row) {
            switch row {
            case .currentPhoto:
                print("CurrentPhoto")
                break
            case .birthCertificate:
                print("BirthCertificate")
                break
            case .driversLicense:
                print("Drivers ")
                break
            case .ssn:
                print("SSN")
                break
            case .passport:
                self.performSegue(withIdentifier: "passport", sender: nil)
                break
            case .other:
                print("oth")
                break
            }
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
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
