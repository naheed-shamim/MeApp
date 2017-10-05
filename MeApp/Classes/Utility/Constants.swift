//
//  Constants.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 03/10/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import Foundation

class Constants:NSObject {
    
    static let screenSize = UIScreen.main.bounds
    static let kScreenWidth = screenSize.width
    static let kScreenHeight = screenSize.height
    
    static let kDateFormat = "dd-MMM-yyyy"
    
    // UserDefaults Key
    static let kUserNameKey = "username"
    static let kNameKey = "name"
    static let kEmail = "email"
    static let kPassword = "password"
    static let kBirthdate = "birthdate"
    static let kGender = "gender"
    
    static let kProfilePic = "profilePic"
    
    class func getArrayForHomeMenu() -> Array<MenuItems>
    {
        var optionDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "Constants", ofType: "plist") {
            optionDict = NSDictionary(contentsOfFile: path)
        }
        
        var arr = Array<MenuItems>()
        
        if let menuArray = optionDict?.object(forKey: "HomeOptions") as? [[String:String]]
        {
            for item in menuArray
            {
                let title = item["title"] //as! String
                let imgLink = item["imgLink"] //as! String
                arr.append(MenuItems(name: title!,  imageName: imgLink!))
            }
        }
        return arr
    }
    
    class func getSocialMediaArray() -> Array<MenuItems>
    {
        var optionDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "Constants", ofType: "plist") {
            optionDict = NSDictionary(contentsOfFile: path)
        }
        
        var arr = Array<MenuItems>()
        
        if let menuArray = optionDict?.object(forKey: "SocialMediaOptions") as? [[String:String]]
        {
            for item in menuArray
            {
                let title = item["title"] //as! String
                let imgLink = item["imgLink"] //as! String
                arr.append(MenuItems(name: title!,  imageName: imgLink!))
            }
        }
        
        return arr
    }
    
    class func getIdentificationMenuArray() -> Array<String> {
        
        var optionDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "Constants", ofType: "plist") {
            optionDict = NSDictionary(contentsOfFile: path)
        }
        
        var arr = Array<String>()
        
        if let menuArray = optionDict?["IdentificationOptions"] as? [String]
        {
            for item in menuArray
            {
                arr.append(item)
            }
        }        
        return arr
    }
    
}
