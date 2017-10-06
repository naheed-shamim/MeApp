//
//  HomeVC.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 14/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

enum Choice: Int {
    case Identification = 0
    case SocialMedia
    case MedicalHistory
    case FamilyHistory
    case WorkSchool
    case Accomplishments
}

class HomeVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuArray = Array<MenuItems>()
    
    override func viewDidLoad() {

        super.viewDidLoad()
        Utility.addSideMenuOn(vc: self)
        menuArray = Constants.getArrayForHomeMenu()

    }    
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! HomeCollectionViewCell
        
        cell.textLabel.text = self.menuArray[indexPath.row].name
        cell.imageView.image = UIImage(named: self.menuArray[indexPath.row].imgName)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellSize : CGFloat = UIScreen.main.bounds.size.width/2 - 10
        return CGSize(width: cellSize, height: cellSize)
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        if let row = Choice(rawValue: indexPath.row) {
            switch row
            {
                case .Identification:
                    self.performSegue(withIdentifier: "Identification", sender: nil)
                    break
                case .SocialMedia:
                    self.performSegue(withIdentifier: "socialMedia", sender: nil)
                    break
                case .WorkSchool:
                    self.performSegue(withIdentifier: "workSchool", sender: nil)
                    break
                case .Accomplishments:
                    self.performSegue(withIdentifier: "accomplishments", sender: nil)
                    break
                default:
                    print("Default")
            }
        }
        print("You selected cell #\(indexPath.item)!")
    }
}


//    func setNavBarTransparent()
//    {
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = .clear
//    }
