//
//  ViewController+Camera.swift
//  MemeMe 1.0
//
//  Created by Alexandre Bianchi on 08/11/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
import UIKit

extension CreateMemeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
       
    // MARK: - Image delegate functions
        
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
    
    // MARK: - Function to pick images from album or camera
    
    func openImagePicker(_ picker: UIImagePickerController, _ type: UIImagePickerController.SourceType){
        picker.sourceType = type
        present(picker, animated: true, completion: nil)
    }
    
}
