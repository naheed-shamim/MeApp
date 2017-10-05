//
//  ImagePicker.swift
//  FreeMason Replica
//
//  Created by Naheed Shamim on 20/09/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

enum ImageSource : Int {
    case Gallery = 0
    case Camera
}

class ImagePicker: UIImagePickerController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
//    static let shared = ImagePicker()
    
    var selectedImg: ((UIImage) -> ())?
    var imgView : UIImage!
    
    
    func pickImage(vc:UIViewController)
    {
        let typeArr = ["OpenGallery","OpenCamera"]
        
        Utility.showAlertActionSheet(array: typeArr, vc: vc) { (index) in
            if index == ImageSource.Gallery.rawValue {
                self.selectImageFrom(source: .Gallery, vc: vc)
            }
            else if index == ImageSource.Camera.rawValue {
            self.selectImageFrom(source: .Camera, vc: vc)
            }
        }
    }
    
    func getImage(callback:@escaping (UIImage) -> Void)
    {
        self.selectedImg = callback
    }
    
    func selectImageFrom(source:ImageSource, vc:UIViewController)
    {
        //Add Indicator
        MeActivityIndicator.shared.showIndicatorOn(vc: vc)
        
        DispatchQueue.main.async {
//            let picker = UIImagePickerController()
            self.delegate = self
            self.allowsEditing = true
            
            if(source == .Gallery)
            {
                self.sourceType = .photoLibrary
            }
            else if(source == .Camera && (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)))
                {
                    self.sourceType = .camera
            }
            else{
                //Hide Indicator
                MeActivityIndicator.shared.hideIndicator()
                print("Camera DOESN'T Work In Simulator, Try on Device")
            }
            
            DispatchQueue.main.async {
                vc.present(self, animated: true, completion: nil)
                //Hide Indicator here
                MeActivityIndicator.shared.hideIndicator()
            }
        }
    }
    
    
    //MARK:- ImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.selectedImg!(chosenImage)
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
