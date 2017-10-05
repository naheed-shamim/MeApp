//
//  SocialMediaVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 22/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit


class SocialMediaVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    var socialMediaArr = Array<MenuItems>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Social Media"
        Utility.addSideMenuOn(vc: self)
        
        socialMediaArr = Constants.getSocialMediaArray()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource protocol    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialMediaArr.count
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sMediaCell", for: indexPath) as! SocialMediaCollectionViewCell
        
        // set the attrib here
        cell.titleLbl.text = socialMediaArr[indexPath.row].name
        cell.img.image = UIImage(named:socialMediaArr[indexPath.row].imgName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("You selected cell \(socialMediaArr[indexPath.row].name)!")
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellSize : CGFloat = UIScreen.main.bounds.size.width/2 - 8
        return CGSize(width: cellSize, height: cellSize)
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
