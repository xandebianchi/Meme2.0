//
//  ViewController+General.swift
//  MemeMe 1.0
//
//  Created by Alexandre Bianchi on 08/11/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    // General constants
    struct Constants {
        static let TopStartText = "TOP"
        static let BottomStartText = "BOTTOM"
    }
    
    // Reset view controls to initial state
    func setViewControlsInitialState() {
        imageMeme.image = nil
        buttonShare.isEnabled = false
        textTop.text = Constants.TopStartText
        textBottom.text = Constants.BottomStartText
    }
    
}
