//
//  ViewController+Keyboard.swift
//  MemeMe 1.0
//
//  Created by Alexandre Bianchi on 08/11/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {

    // Text constants
    struct TextConstants {
        static let memeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth: -3.0
        ]
    }
    
    // Set text fields initial properties
    func setTextFieldsInitialProperties() {
        textTop.defaultTextAttributes = TextConstants.memeTextAttributes
        textBottom.defaultTextAttributes = TextConstants.memeTextAttributes
        textTop.textAlignment = NSTextAlignment.center
        textBottom.textAlignment = NSTextAlignment.center
        textTop.delegate = self
        textBottom.delegate = self
    }
    
    // MARK: Functions related to keyboard presentation
    
    // Function called when keyboard must be shown and the screen must be moved up
    @objc func keyboardWillShow(_ notification:Notification) {
        if (textBottom.isEditing) { // It must be moved only for bottom text
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    // Function called when screen must be moved down
    @objc func keyboardWillHide(_ notification:Notification) {
        if (view.frame.origin.y != 0) { // Moved down only if it's already moved up
            view.frame.origin.y = 0
        }
    }

    // Get keyboard size for move the screen
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    // MARK: Subscribe and unsubscribe from keyboard notifications
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Text field delegate functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
