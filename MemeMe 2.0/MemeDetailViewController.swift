//
//  MemeDetailViewController.swift
//  MemeMe 2.0
//
//  Created by Alexandre Bianchi on 18/12/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
  
    // MARK: - Properties
    
    var memedImage: UIImage!
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageMeme: UIImageView!
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        imageMeme.image = memedImage
    }
    
}
