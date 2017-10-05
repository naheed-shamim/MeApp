//
//  Utility.swift
//  CloudKitSwift
//
//  Created by Naheed Shamim on 25/08/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

struct MenuItems
{
    var name: String
    var imgName : String
    init(name: String, imageName:String) {
        self.name = name
        self.imgName = imageName
    }
}

class Utility: NSObject {
    
    // Returns the DocDirectory path as an URL
    class func getImageURL(image: UIImage, imageName:String) -> URL
    {
        let imgURL = Utility.saveToDocDirectory(fileName: imageName, imageToSave: image)
        return imgURL as URL
    }
    
    // Saves the file into the Document Directory
    class func saveToDocDirectory(fileName:String, imageToSave:UIImage) -> NSURL
    {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(fileName)
        print(paths)
        
        let imageData = UIImageJPEGRepresentation(imageToSave, 0.9)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        
        return NSURL.fileURL(withPath: paths) as NSURL
    }
    
    // Returns the Documents Directory Path
    class func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    // Save image to Documents Directory
    class func saveToDocDirectory(image:UIImage,imgName: String)
    {
        let fileManager = FileManager.default
        let imgPath = (self.getDirectoryPath() as NSString).appendingPathComponent(imgName)
        
        
        let imageData = UIImageJPEGRepresentation(image, 0.9)
        fileManager.createFile(atPath: imgPath as String, contents: imageData, attributes: nil)
    }
    
    class func getImageFromDocDirectory(imgName:String) -> UIImage?
    {
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(imgName)
        if fileManager.fileExists(atPath: imagePAth){
            return UIImage(contentsOfFile: imagePAth)!
        }
        return nil
    }
    
    
    
    
    // Deletes the specified file from the Document Directory
    class func clearDocumentDirectory(filename:String)
    {
        let fileManager = FileManager.default
        
        let filePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(filename)
        
        if fileManager.fileExists(atPath: filePath){
            try! fileManager.removeItem(atPath: filePath)
        }else{
            print("Something wrong.")
        }
    }

    // MARK: - Date Utils
    class func showDatePicker(dateTextField:UITextField)
    {
        let datePicker = MeDatePicker(dateTextField: dateTextField)
        
        if(dateTextField.text!.characters.count == 0)    {
            dateTextField.text = Utility.getCurrentDate()
        }
        dateTextField.inputView = datePicker
    }
    
    class func getCurrentDate() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.kDateFormat
        
        return dateFormatter.string(from: Date())
    }
    
    class func stringFromDate(eventDate:NSDate) -> String {
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Constants.kDateFormat
        
        return dateFormatter.string(from: eventDate as Date)
    }
    
    class func dateFromString(dateString:String) -> NSDate {
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Constants.kDateFormat//"dd-MM-yyyy"
        
        return dateFormatter.date(from:dateString)! as NSDate
    }
    
    
    // MARK: - UserDefaults Utils
    class func getUserDefaults() -> NSDictionary {
        
        let dict = NSMutableDictionary()
        let defaults = UserDefaults.standard
        
        if let password = defaults.string(forKey: Constants.kPassword) {
            dict.setValue(password, forKey: Constants.kPassword)
        }
        
        if let name = defaults.string(forKey: Constants.kNameKey) {
            dict.setValue(name, forKey: Constants.kNameKey)
        }
        
        if let email = defaults.string(forKey: Constants.kEmail) {
            dict.setValue(email, forKey: Constants.kEmail)
        }
        
        if let birthdate = defaults.string(forKey: Constants.kBirthdate){
            dict.setValue(birthdate, forKey: Constants.kBirthdate)
        }
        
        if let gender = defaults.string(forKey: Constants.kGender) {
            dict.setValue(gender, forKey: Constants.kGender)
        }
 
        return dict
    }
    
    
    // MARK: - View Utils
    class func showWithZoomAnim(view:UIView)
    {
        view.transform = CGAffineTransform(scaleX: 0.1,y: 0.1)
        
        UIView.animate(withDuration: 0.2, animations: {
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    class func hideWithZoomAnim(view:UIView, completion: (Void)?)
    {
        view.transform = CGAffineTransform(scaleX: 1,y: 1)
        
        UIView.animate(withDuration: 0.2, animations: {
            view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        },completion:{ _ in
            if(completion != nil){
                completion!
            }
        })
    }
    
    class func showAlertActionSheet(array:Array<String>, vc:UIViewController, completion: @escaping (Int) -> ())
    {
        var index : Int = 0
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for title in array {
            index += 1
            
            let action = UIAlertAction(title: title, style: .default, handler: { (action) in
                completion(array.index(of: title)!)
            })
        
        alert.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
        
    }
    class func showAlert(overVC vc:UIViewController, title: String = "Message", message: String?, completion: (()-> (Void))?)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            
            if(completion != nil) {
                completion!()
            }
        }
        
        alertController.addAction(action)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    class func showDismissAlert(overVC vc: UIViewController, message:String?)
    {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (alertAction) in
            alertController.dismiss(animated: true, completion: nil)
            vc.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(action)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    class func addSideMenuOn(vc: UIViewController)
    {
        let revealViewController = SWRevealViewController().revealViewController()
        
        let sideMenuBtn = UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: .plain, target: revealViewController, action: #selector(SWRevealViewController.revealToggle(_:)))
        vc.navigationController?.topViewController?.navigationItem.leftBarButtonItem = sideMenuBtn
    }
}
