//
//  ViewController+Camera.swift
//  MemeMe 1.0
//
//  Created by Alexandre Bianchi on 08/11/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: General functions
    
    // Enable camera button if camera hardware is available
    func verifyHardwareSetCameraButtonState() {
        buttonCamera.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    // MARK: Image delegate functions
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageMeme.image = image
            buttonShare.isEnabled = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Functions to pick images from album or camera
    
    func pickAnImageFromAlbum() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func pickAnImageFromCamera() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
}
