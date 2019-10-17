//
//  PhotoViewController.swift
//  Photos
//
//  Created by Henry Sills on 11/17/19.
//  Copyright © 2019 Henry Sills. All rights reserved.
//

import UIKit
import MobileCoreServices

class PhotoViewController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Camera(_ sender: Any) {
       
        guard PhotoViewController.isSourceTypeAvailable(.camera) else {
            
            let alert = UIAlertController(title: "Camera Not Available", message: "Camera not available", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        imagePicker.delegate = self
        imagePicker.sourceType = SourceType.camera
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        
        guard PhotoViewController.isSourceTypeAvailable(.photoLibrary) else {
            let alert = UIAlertController(title: "Photo Library not found", message: "The Photo Library could not be found.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            return
        }
        print("Image couldn't be opened")
        
        func imagePickerControllerCancelled(_ picker: UIImagePickerController){
            
            print("Cancelled")
        }
    }
}
