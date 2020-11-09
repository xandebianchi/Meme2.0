//
//  ViewController.swift
//  MemeMe 1.0
//
//  Created by Alexandre Bianchi on 04/11/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topToolbar: UIToolbar!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var imageMeme: UIImageView!
    @IBOutlet weak var textTop: UITextField!
    @IBOutlet weak var textBottom: UITextField!
    @IBOutlet weak var buttonCamera: UIBarButtonItem!
    @IBOutlet weak var buttonShare: UIBarButtonItem!
    @IBOutlet weak var buttonCancel: UIBarButtonItem!
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        verifyHardwareSetCameraButtonState()
        setViewControlsInitialState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToKeyboardNotifications()
        setTextFieldsInitialProperties()
    }
    
    // MARK: Actions
    
    @IBAction func pickAnImageFromAlbumAction(_ sender: Any) {
        pickAnImageFromAlbum()
    }

    @IBAction func pickAnImageFromCameraAction(_ sender: Any) {
        pickAnImageFromCamera()
    }
        
    @IBAction func shareImageAction(_ sender: Any) {
        shareImage()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        setViewControlsInitialState()
    }
    
}
