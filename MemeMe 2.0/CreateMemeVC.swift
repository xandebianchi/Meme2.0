//
//  ViewController.swift
//  MemeMe 1.0
//
//  Created by Alexandre Bianchi on 04/11/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class CreateMemeVC: UIViewController {
    
    // MARK: - Variables and constants
    
    struct Constants {
        static let TopStartText = "TOP"
        static let BottomStartText = "BOTTOM"
    }
        
    @IBOutlet weak var topToolbar: UIToolbar!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var imageMeme: UIImageView!
    @IBOutlet weak var textTop: UITextField!
    @IBOutlet weak var textBottom: UITextField!
    @IBOutlet weak var buttonCamera: UIBarButtonItem!
    @IBOutlet weak var buttonShare: UIBarButtonItem!
    @IBOutlet weak var buttonCancel: UIBarButtonItem!
    
    let picker = UIImagePickerController()
        
    // MARK: - Default functions
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setViewControlsToInitialState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegates in viewDidLoad for the result of camera picker be presented correctly after taking a picture
        picker.delegate = self
        
        // Enable camera button if camera hardware is available
        buttonCamera.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        setupTextFieldInitialProperties(toTextField: textTop)
        setupTextFieldInitialProperties(toTextField: textBottom)
        
        subscribeToKeyboardNotifications()
    }
    
    // MARK: - Actions
    
    @IBAction func pickAnImageFromAlbumAction(_ sender: Any) {
        openImagePicker(picker, .photoLibrary)
    }

    @IBAction func pickAnImageFromCameraAction(_ sender: Any) {
        openImagePicker(picker, .camera)
    }
        
    @IBAction func shareImageAction(_ sender: Any) {
        shareImage()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        setViewControlsToInitialState()
    }
    
    // MARK: - Auxiliar functions
    
    // Reset view controls to initial state
    func setViewControlsToInitialState() {
        imageMeme.image = nil
        buttonShare.isEnabled = false
        textTop.text = Constants.TopStartText
        textBottom.text = Constants.BottomStartText
    }
    
}
